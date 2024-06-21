import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:imovelhub/pages/home/home_page.dart';
import 'package:imovelhub/pages/login/login_page.dart';
import 'package:imovelhub/services/auth_service.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthService.to.userIsAuthenticated.value
        ? const HomePage()
        : const LoginPage());
  }
}
