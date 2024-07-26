import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleCardHome extends StatelessWidget {
  
  const TitleCardHome({
    super.key,
    required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context) {

    const titleStyleCardHome = TextStyle(
      fontSize: 15.0
    );

    return Row(
      children: [
        Text(
          title,
          style: titleStyleCardHome,
        ),
        const Icon(Icons.arrow_forward),
      ],
    );
  }
}