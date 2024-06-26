import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:imovelhub/models/debt_detail_model.dart';
import 'package:imovelhub/widgets/custom_app_bar.dart';

class PropertyDetailsPage extends StatefulWidget {
  final String? imageUrl;
  final String? status;
  final String title;
  final String address;
  final String inscricao;

  const PropertyDetailsPage({
    super.key,
    required this.imageUrl,
    required this.status,
    required this.title,
    required this.address,
    required this.inscricao,
  });

  @override
  PropertyDetailsPageState createState() => PropertyDetailsPageState();
}

class PropertyDetailsPageState extends State<PropertyDetailsPage> {
  late Future<List<DebtDetail>> futureDebtDetails;

  @override
  void initState() {
    super.initState();
    futureDebtDetails = loadDebtDetails();
  }

  Future<List<DebtDetail>> loadDebtDetails() async {
    final jsonString =
        await rootBundle.loadString('lib/mock/exemplo_detalhamento.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((data) => DebtDetail.fromJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        canLogout: false,
      ),
      body: ListView(
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
          Text(
            widget.status ?? '',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.address,
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
          FutureBuilder<List<DebtDetail>>(
            future: futureDebtDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No debt details found'));
              } else {
                final debtDetails = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: debtDetails.length,
                  itemBuilder: (context, index) {
                    final detail = debtDetails[index];
                    return Card(
                      color: Colors.grey[200],
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
