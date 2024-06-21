import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imovelhub/controllers/loginController.dart';
import 'package:imovelhub/widgets/custom_elevated_button.dart';
import 'package:imovelhub/widgets/custom_text_button.dart';
import 'package:imovelhub/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: ListView(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 250,
                      ),
                      const Center(
                        child: Text(
                          'BEM VINDO',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        labelText: 'E-mail',
                        icon: Icons.account_circle_outlined,
                        obscureText: false,
                        controller: controller.email,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        labelText: 'Senha',
                        icon: Icons.lock_outline,
                        obscureText: true,
                        controller: controller.senha,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          text: 'Criar conta?',
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.registrar();
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                        text: 'Entrar',
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
