import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.icon,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.black, width: 0.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.black, width: 0.7),
        ),
      ),
      validator: labelText == 'Senha'
          ? (value) {
              if (value!.isEmpty) {
                return 'Informa sua senha!';
              } else if (value.length < 6) {
                return 'Sua senha deve ter no mínimo 6 caracteres';
              }
              return null;
            }
          : null,
    );
  }
}
