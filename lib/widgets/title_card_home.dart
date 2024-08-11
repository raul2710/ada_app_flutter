import 'package:flutter/material.dart';

class TitleCardHome extends StatelessWidget {
  
  const TitleCardHome({
    super.key,
    required this.title,
    this.isWhite = true
  });

  final String title;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    
    var titleStyleCardHome = TextStyle(
      color: isWhite ? Colors.white : Colors.black,
      fontSize: 15.0
    );

    return Row(
      children: [
        Text(
          title,
          style: titleStyleCardHome,
        ),
        Icon(Icons.arrow_forward, color: isWhite ? Colors.white : Colors.black,),
      ],
    );
  }
}