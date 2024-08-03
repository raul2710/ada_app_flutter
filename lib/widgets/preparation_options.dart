import 'package:flutter/material.dart';

class PreparationOptions extends StatelessWidget {
  
  const PreparationOptions({
    super.key, 
    required this.title, 
    required this.image, 
    required this.onTap,
  });

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            // borderRadius: BorderRadius.circular(300.0),
            child: Image.asset(image),
          ),
          Text(title),
        ],
      ),
    );
  }
}