import 'package:flutter/material.dart';

class FirstStepsScreen extends StatefulWidget {

  const FirstStepsScreen({ super.key });

  @override
  State<FirstStepsScreen> createState() => _FirstStepsScreenState();
}

class _FirstStepsScreenState extends State<FirstStepsScreen> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          //  appBar: AppBar(toolbarOpacity: 1,),
           body: Container(
            alignment: Alignment.center,
              color: const Color(0xFF3F80EA),
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('A.D.A'),
                  const Text('Alert Disaster Assist'),

                  const Icon(Icons.ac_unit_sharp),

                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/main')
                    },
                    label: const Text('Login with Google'),
                    // child: Text('Login with Google'),
                    icon: const Icon(Icons.face),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  ),
                  const SizedBox(height: 15,),
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/main')
                    }, 
                    label: const Text('Login with Google'),
                    // child: Text('Login with Google'),
                    icon: const Icon(Icons.face),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  ),
                  const SizedBox(height: 15,),
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/main')
                    }, 
                    label: const Text('Login with Google'),
                    // child: Text('Login with Google'),
                    icon: const Icon(Icons.face),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  ),
                  const SizedBox(height: 15,),
                ],
               ),
             ),
           )
       );
  }
}