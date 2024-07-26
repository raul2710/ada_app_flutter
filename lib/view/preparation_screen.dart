import 'package:flutter/material.dart';

class Preparation extends StatefulWidget {
  const Preparation({super.key});

  @override
  State<Preparation> createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> {
  int currentPageIndex = 0;

  TextStyle titleStyle = const TextStyle(
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Preparation',
              style: titleStyle,
              textAlign: TextAlign.start,
            ),
            const Divider(),
            const Text('Introduction'),
            const Text("Hello Dear User! We are happy that you decided to dowload ADA’s app. This app will help people to prepare themselves to possible disasters that can happen. Will provide too, useful information in order to"),
            
            Image.asset(
              'lib/images/MapPreparation.png',

              alignment: Alignment.center,
            )
          ],
        )
      )
    );
  }
}
