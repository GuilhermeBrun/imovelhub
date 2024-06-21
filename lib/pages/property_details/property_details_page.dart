import 'package:flutter/material.dart';
import 'package:imovelhub/widgets/custom_app_bar.dart';

class PropertyDetailsPage extends StatelessWidget {
  final String? imageUrl;
  final String status;
  final String title;
  final String address;
  final String code;

  const PropertyDetailsPage({
    super.key,
    this.imageUrl,
    required this.status,
    required this.title,
    required this.address,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: imageUrl == null
                ? Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                  )
                : Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
          ),
          const SizedBox(height: 16.0),
          Text(
            status,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            address,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            code,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Descrição',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Aqui você pode adicionar uma descrição detalhada do imóvel. Inclua todas as informações relevantes que os usuários precisam saber, como tamanho, número de quartos, banheiros, comodidades, etc.',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
