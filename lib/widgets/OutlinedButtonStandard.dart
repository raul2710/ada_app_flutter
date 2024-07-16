import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedButtonStandard extends StatelessWidget {

  const OutlinedButtonStandard({
    super.key, 
    required this.text, 
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        overlayColor: const Color(0xFF000000),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        foregroundColor: const Color(0xFFE88C38),
      ),
      child: Text(text),
    );
  }
}