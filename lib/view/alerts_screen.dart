import 'package:flutter/material.dart';

import '../widgets/alert_card.dart';
import '../widgets/text_button_standard.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {

  var buttonStyle = OutlinedButton.styleFrom(
    fixedSize: const Size.fromWidth(300.0),
    foregroundColor: const Color(0xFF000000),
    side: const BorderSide(color: Color(0xFF000000),),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0))
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        backgroundColor: Color(0xFFF2923A),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),

            OutlinedButton.icon(
              onPressed: ()=>{
                Navigator.pushNamed(context, '/main')
              },
              label: const Text('Select your location'),
              // child: Text('Login with Google'),
              icon: const Icon(Icons.location_on_outlined), 
              style: buttonStyle,
              iconAlignment: IconAlignment.start,
            ),
            const SizedBox(height: 15,),
            OutlinedButton.icon(
              onPressed: ()=>{}, 
              label: const Text('country'),
              style: buttonStyle,
            ),
            
            const SizedBox(height: 15,),
            
            OutlinedButton.icon(
              onPressed: ()=>{}, 
              label: Text('city'),
              style: buttonStyle,
            ),

            const SizedBox(height: 15,),

            TextButtonStandard(
              text: 'Continue',
              onPressed: (){},
            ),

            const SizedBox(height: 30,),

            SingleChildScrollView(
              child: Container(
                color: const Color(0xFF1D1B20),
                // height: 500,
                child: const Column(
                  children: [
                    Text('History of Alerts'),
                    AlertCard(
                      image: 'lib/images/warning.png',
                      title: 'NEW ALERT',
                      about: 'Alerts about Floods were founded in your area.',
                      time: '9:20 pm',  
                    ),
                    AlertCard(
                      image: 'lib/images/warning.png',
                      title: 'NEW ALERT',
                      about: 'Alerts about Floods were founded in your area.',
                      time: '9:20 pm',  
                    ),
                    AlertCard(
                      image: 'lib/images/warning.png',
                      title: 'NEW ALERT',
                      about: 'Alerts about Floods were founded in your area.',
                      time: '9:20 pm',  
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}