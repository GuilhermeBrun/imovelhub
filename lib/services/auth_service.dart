import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?>? _firebaseUser;
  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (_firebaseUser == null) {
      showSnack('Erro!', '');
    }
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser!.bindStream(_auth.authStateChanges());

    ever(_firebaseUser!, (User? user) {
      if (user != null) {
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  User get user => _firebaseUser!.value!;

  static AuthService get to => Get.find<AuthService>();

  showSnack(String titulo, String? erro) {
    Get.snackbar(
      titulo,
      erro ?? 'Erro desconhecido!',
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      String? errorMessage =
          e is FirebaseAuthException ? e.message : e.toString();
      showSnack('Erro ao registrar!', errorMessage!);
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      String? errorMessage =
          e is FirebaseAuthException ? e.message : e.toString();
      return showSnack('Erro no Login!', errorMessage!);
    }
  }

  logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      String? errorMessage =
          e is FirebaseAuthException ? e.message : e.toString();
      showSnack('Erro ao sair!', errorMessage!);
    }
  }
}
