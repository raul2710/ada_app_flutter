import 'package:flutter/material.dart';

import '../widgets/TextButtonStandard.dart';

class FirstStepsScreen extends StatefulWidget {

  const FirstStepsScreen({ super.key });

  @override
  State<FirstStepsScreen> createState() => _FirstStepsScreenState();
}

class _FirstStepsScreenState extends State<FirstStepsScreen> {
  @override
  Widget build(BuildContext context) {

  const txtTitleStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 36
  );

  var buttonStyle = OutlinedButton.styleFrom(
    fixedSize: const Size.fromWidth(300.0),
    foregroundColor: const Color(0xFFFFFFFF),
    side: const BorderSide(color: Color(0xFFFFFFFF),),
    // shape: OutlinedBorder
  );

  return Scaffold(
          //  appBar: AppBar(toolbarOpacity: 1,),
          backgroundColor: const Color(0xFF3F80EA),
           body: Center(
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Text(
                    'A.D.A',
                    style: txtTitleStyle,          
                  ),
                  const Text(
                    'Alert Disaster Assist',
                    style: txtTitleStyle, 
                  ),
                  
                  Image.asset(
                    'lib/images/Icon.png'
                  ),
                  const SizedBox(height: 15,),
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
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/main')
                    }, 
                    label: const Text('Brazil'),
                    // child: Text('Login with Google'),
                    //icon: const Icon(Icons.location_on_outlined),
                    style: buttonStyle,
                    //iconAlignment: IconAlignment.start,
                  ),
                  const SizedBox(height: 15,),
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/main')
                    }, 
                    label: const Text('São Paulo'),
                    // child: Text('Login with Google'),
                    style: buttonStyle,
                  ),
                  const SizedBox(height: 15,),
                  TextButtonStandard(
                    text: 'Continue',
                    onPressed: (){},
                  ),
                ],
               ),
             ),
           )
       );
  }
}