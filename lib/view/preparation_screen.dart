import 'package:flutter/material.dart';

class Preparation extends StatefulWidget {
  const Preparation({super.key});

  @override
  State<Preparation> createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> {
  int currentPageIndex = 0;

  TextStyle titleStyle = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE88C38),
        // automaticallyImplyLeading: true,
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

            const SizedBox(height: 15.0,),

            const Text(
              'Introduction',
              style: TextStyle(fontSize: 15.0),
            ),

            const SizedBox(height: 15.0,),

            const Text("Hello Dear User! We are happy that you decided to dowload ADA’s app. This app will help people to prepare themselves to possible disasters that can happen. Will provide too, useful information in order to"),
            
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/images/MapPreparation.png',
              ),
            )
          ],
        )
      )
    );
  }
}
