import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:imovelhub/models/debt_detail_model.dart';
import 'package:imovelhub/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

class PropertyDetailsPage extends StatefulWidget {
  final String? imageUrl;
  final String title;
  final String address;
  final String inscricao;

  const PropertyDetailsPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.inscricao,
  });

  @override
  PropertyDetailsPageState createState() => PropertyDetailsPageState();
}

class PropertyDetailsPageState extends State<PropertyDetailsPage> {
  late Future<PropertyDebt?> futureDebtDetails;

  @override
  void initState() {
    super.initState();
    futureDebtDetails = loadDebtDetails();
  }

  String _removePunctuation(String input) {
    return input.replaceAll(RegExp(r'[^\w\s]'), '');
  }

  Future<PropertyDebt?> loadDebtDetails() async {
    final jsonString = await rootBundle.loadString('lib/mock/detalhes.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    String inscricaoWithoutPunctuation = _removePunctuation(widget.inscricao);

    for (var property in jsonResponse) {
      PropertyDebt debt = PropertyDebt.fromJson(property);
      if (_removePunctuation(debt.inscricao) == inscricaoWithoutPunctuation) {
        debt.closestParcel = _findClosestParcel(debt.parcelas);
        return debt;
      }
    }
    return null;
  }

  DebtDetail? _findClosestParcel(List<DebtDetail> parcels) {
    final DateTime now = DateTime.now();
    DebtDetail? closestParcel;
    Duration closestDuration = const Duration(days: 365 * 100);

    for (var parcel in parcels) {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final DateTime dueDate = formatter.parse(parcel.vencimento);
      final Duration difference = dueDate.difference(now);

      if (difference.inDays >= 0 && difference < closestDuration) {
        closestDuration = difference;
        closestParcel = parcel;
      }
    }

    return closestParcel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        canLogout: false,
      ),
      body: FutureBuilder<PropertyDebt?>(
        future: futureDebtDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No debt details found'));
          } else {
            final debt = snapshot.data!;
            final closestParcel = debt.closestParcel;

            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: widget.imageUrl == null
                      ? Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                        )
                      : Image.network(
                          widget.imageUrl!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(top: 10, bottom: 15),
                ),
                Text(
                  closestParcel != null
                      ? 'Próximo vencimento em: ${closestParcel.vencimento}'
                      : '',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.address,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.inscricao,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Detalhes da Dívida',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: debt.parcelas.length,
                  itemBuilder: (context, index) {
                    final detail = debt.parcelas[index];
                    return Card(
                      color: Colors.grey[200],
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            detail.vencido
                                ? Positioned(
                                    top: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Colors.red,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      margin:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: const Text(
                                        'Vencido',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Text('Tributo: ${detail.tributo}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text('Dívida: ${detail.divida}'),
                            Text('Parcela: ${detail.pc}'),
                            Text('Plano: ${detail.pl}'),
                            Text('Mês: ${detail.mes}'),
                            Text('Ano: ${detail.ano}'),
                            Text('Vencimento: ${detail.vencimento}'),
                            Text('Principal: ${detail.principal}'),
                            Text('Total: ${detail.total}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
