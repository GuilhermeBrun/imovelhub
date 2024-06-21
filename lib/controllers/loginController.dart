import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imovelhub/services/auth_service.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final senha = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var isLogin = true.obs;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    ever(isLogin, (visible) {
      formKey.currentState!.reset();
    });
  }

  login() async {
    isLoading.value = true;
    await AuthService.to.login(email.text, senha.text);
    isLoading.value = false;
  }

  registrar() async {
    isLoading.value = true;
    await AuthService.to.createUser(email.text, senha.text);
    isLoading.value = false;
  }

  logout() async {
    isLoading.value = true;
    await AuthService.to.logout();
    isLoading.value = false;
  }
}
