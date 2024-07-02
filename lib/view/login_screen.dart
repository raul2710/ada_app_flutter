import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({ super.key });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          //  appBar: AppBar(title: const Text('Login Test'),),
           body: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 
                  // Icon
                  // 
                  const Icon(Icons.person),
                  // 
                  // Title
                  // 
                  const SizedBox(height: 25,),
                  const Text(
                    'First Step, lets create your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  // 
                  // Subtitle
                  // 
                  const Text(
                    'You can login with google, or create with another email address',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25,),
                  // 
                  // Button: Login with Google
                  // 
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/first-steps')
                    }, 
                    label: const Text('Login with Google'),
                    // child: Text('Login with Google'),
                    icon: const Icon(Icons.face),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  ),
                  const SizedBox(height: 15,),
                  // 
                  // Button: Create an account with another email
                  // 
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/subscribe')
                    }, 
                    label: const Text('Create an account with another email'),
                    // child: Text('Login with Google'),
                    style: OutlinedButton.styleFrom(fixedSize: const Size.fromWidth(300.0)),
                    iconAlignment: IconAlignment.end,
                  )
                ],
              ),
            ),
           ),
       );
  }
}