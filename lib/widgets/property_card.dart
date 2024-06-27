import 'package:flutter/material.dart';
import 'package:imovelhub/pages/property_details/property_details_page.dart';

import 'custom_elevated_button.dart';

class PropertyCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String address;
  final String inscricao;

  const PropertyCard({
    super.key,
    this.imageUrl,
    required this.title,
    required this.address,
    required this.inscricao,
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
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
            margin: const EdgeInsets.only(top: 10, bottom: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  inscricao,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
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
                            title: title,
                            address: address,
                            inscricao: inscricao,
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
