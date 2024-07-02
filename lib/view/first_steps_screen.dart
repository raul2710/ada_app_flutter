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
           appBar: AppBar(title: const Text(''),),
           body: Container(
              color: Colors.amber,
             child: Padding(
              
               padding: const EdgeInsets.all(15.0),
               child: Column(
                children: [
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/mainPage')
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
                      Navigator.pushNamed(context, '/mainPage')
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
                      Navigator.pushNamed(context, '/mainPage')
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