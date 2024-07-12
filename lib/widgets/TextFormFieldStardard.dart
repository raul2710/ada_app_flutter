import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textformfieldstardard extends StatelessWidget {

  const Textformfieldstardard({
    super.key,
    required this.labelText,
    required this.controller,
    this.prefixIcon,
    this.validatorMessage,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
  });

  final String labelText;
  final TextEditingController controller;
  final IconData ?prefixIcon;
  final String ?validatorMessage;
  final bool obscureText;
  final TextInputType ?keyboardType;
  final List<TextInputFormatter> ?inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: (value) {
        return value!.isEmpty ? validatorMessage : null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        border: const OutlineInputBorder()
      ),
    );
  }
}