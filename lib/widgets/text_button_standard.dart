import 'package:flutter/material.dart';

class TextButtonStandard extends StatelessWidget {

  const TextButtonStandard({
    super.key, 
    required this.text, 
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor:const Color(0xFFE88C38),
        foregroundColor: const Color(0xFFFFFFFFF),
      ),
      child: Text(text),
    );
  }
}