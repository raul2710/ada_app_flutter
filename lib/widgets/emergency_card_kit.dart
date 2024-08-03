import 'package:flutter/material.dart';

class EmergencyCardKit extends StatelessWidget {
  const EmergencyCardKit({
    super.key, 
    required this.image, 
    required this.title, 
    required this.description
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title
              ),
              Text(
                description,
              ),
            ],
          ),
        )
      ],
    );
  }
}