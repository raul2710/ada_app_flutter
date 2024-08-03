import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({
    super.key, 
    required this.image, 
    required this.title, 
    required this.about, 
    required this.time
  });

  final String image;
  final String title;
  final String about;
  final String time;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Image.asset(image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                Text(
                  about,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ],
            ), 
          ),
        ],
      ),
    );
  }
}