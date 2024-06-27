import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:imovelhub/models/property_model.dart';
import 'package:imovelhub/widgets/custom_app_bar.dart';
import 'package:imovelhub/widgets/property_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<Property>> futureProperties;

  @override
  void initState() {
    super.initState();
    futureProperties = loadProperties();
  }

  Future<List<Property>> loadProperties() async {
    final jsonString =
        await rootBundle.loadString('lib/mock/primeira_raspagem.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((data) => Property.fromJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        canLogout: true,
      ),
      body: FutureBuilder<List<Property>>(
        future: futureProperties,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No properties found'));
          } else {
            final properties = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: properties.length,
              itemBuilder: (context, index) {
                final property = properties[index];
                return PropertyCard(
                  title: property.proprietario,
                  address: property.endereco,
                  inscricao: property.inscricao,
                );
              },
            );
          }
        },
      ),
    );
  }
}
