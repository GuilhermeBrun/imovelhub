import 'package:flutter/material.dart';
import 'package:imovelhub/pages/property_details/property_details_page.dart';

import 'custom_elevated_button.dart';

class PropertyCard extends StatelessWidget {
  final String? imageUrl;
  final String? status;

  const PropertyCard({
    super.key,
    this.imageUrl,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: imageUrl == null
                    ? Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                        ),
                      )
                    : Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
              ),
              if (status != null)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color(0xFF0000FE),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      status!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MELGACO, BARAO DE Complemento: COMP DE ACOES',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Bairro: CENTRO SUL CEP: 78.005-500',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  '01.5.32.023.0493.001',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomElevatedButton(
                    minHeight: 30,
                    minWidth: 130,
                    fontSize: 10,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PropertyDetailsPage(
                            imageUrl: imageUrl,
                            status: status ?? 'Status desconhecido',
                            title:
                                'MELGACO, BARAO DE Complemento: COMP DE ACOES',
                            address: 'Bairro: CENTRO SUL CEP: 78.005-500',
                            code: '01.5.32.023.0493.001',
                          ),
                        ),
                      );
                    },
                    text: 'Mais detalhes',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
