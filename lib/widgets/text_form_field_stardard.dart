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
    this.onPressedIcon,
  });

  final String labelText;
  final TextEditingController controller;
  final IconData ?prefixIcon;
  final String ?validatorMessage;
  final bool obscureText;
  final TextInputType ?keyboardType;
  final List<TextInputFormatter> ?inputFormatters;
  final VoidCallback ?onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,

      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
          onPressed: controller.clear,
          icon: const Icon(Icons.cancel_outlined),
        ),
        border: const OutlineInputBorder(),
        prefixIconColor: const Color(0xFFE88C38),
        floatingLabelStyle: const TextStyle(color: Color(0xFFE88C38),),
        labelStyle: const TextStyle(color: Color(0xFFE88C38),),
      ),

      validator: (value) {
        return value!.isEmpty ? validatorMessage : null;
      },
    );
  }
}