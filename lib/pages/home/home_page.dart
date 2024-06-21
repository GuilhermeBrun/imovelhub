import 'package:flutter/material.dart';
import 'package:imovelhub/widgets/custom_app_bar.dart';
import 'package:imovelhub/widgets/property_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          PropertyCard(
            imageUrl: 'https://via.placeholder.com/150',
            status: 'Próximo ao vencimento',
          ),
          PropertyCard(
            imageUrl: 'https://via.placeholder.com/150',
          ),
          PropertyCard(
            imageUrl: 'https://via.placeholder.com/150',
          ),
          PropertyCard(),
        ],
      ),
    );
  }
}
