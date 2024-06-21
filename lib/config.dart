import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imovelhub/services/auth_service.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase
  await Firebase.initializeApp();

  // Para executar o Firebase no Emulador Local do Firebase descomentar a seguir
  // FirebaseFirestore.instance.settings =
  //   Settings(host: 'localhost:8080', sslEnabled: false);

  // GetX Bindings
  Get.lazyPut<AuthService>(() => AuthService());
}
