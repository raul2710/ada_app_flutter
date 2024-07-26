import 'package:flutter/material.dart';

import 'TitleCardHome.dart';

class ClickableCardHome extends StatelessWidget {
  
  const ClickableCardHome({
    super.key,
    required this.titleCard, 
    required this.image, 
    required this.description, 
    required this.color, 
    required this.onTap,
  });

  final String titleCard;
  final String image;
  final String description;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleCardHome(title: titleCard),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(image),
            ),
            const SizedBox(
              height:  10,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}