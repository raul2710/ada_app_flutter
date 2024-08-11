import 'package:flutter/material.dart';

class TitleCardHome extends StatelessWidget {
  
  const TitleCardHome({
    super.key,
    required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context) {

    const titleStyleCardHome = TextStyle(
      color: Colors.white,
      fontSize: 15.0
    );

    return Row(
      children: [
        Text(
          title,
          style: titleStyleCardHome,
        ),
        const Icon(Icons.arrow_forward, color: Colors.white,),
      ],
    );
  }
}