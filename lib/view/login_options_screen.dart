import 'package:flutter/material.dart';

import '../controller/login_google_controller.dart';

class LoginOptions extends StatefulWidget {

  const LoginOptions({ super.key });

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
   @override
   Widget build(BuildContext context) {

    ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      fixedSize: const Size.fromWidth(300.0),
      foregroundColor: const Color(0xFF000000),
      side: const BorderSide(color: Color(0xFF000000),)
    );

    ButtonStyle buttonStyleLoginGoogle = OutlinedButton.styleFrom(
      fixedSize: const Size.fromWidth(300.0),
      foregroundColor: const Color(0xFFFFFFFF),
      backgroundColor: const Color(0xFFE88C38),
      side: const BorderSide(color: Color(0xFFE88C38),)
    );

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
              Image.asset(
                'lib/images/LoginIcon.png'
              ),
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
                onPressed: () {
                  signInWithGoogle();

                  
                }, 
                label: const Text('Login with Google'),
                // child: Text('Login with Google'),
                icon: const Icon(Icons.face),
                style: buttonStyleLoginGoogle,
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
                style: buttonStyle,
                iconAlignment: IconAlignment.end,
              ),
              const SizedBox(height: 15,),
              // 
              // Button: Continue without login
              // 
              OutlinedButton.icon(
                onPressed: ()=>{
                  Navigator.pushNamed(context, '/first-steps')
                }, 
                label: const Text('Continue without login'),
                // child: Text('Login with Google'),
                style: buttonStyle,
                iconAlignment: IconAlignment.end,
              ),
              const SizedBox(height: 15,),
              // 
              // Button: Continue without login
              // 
              OutlinedButton.icon(
                onPressed: ()=>{
                  Navigator.pushNamed(context, '/loginwithemailandpassword')
                }, 
                label: const Text('Login with Email and Password'),
                // child: Text('Login with Google'),
                style: buttonStyle,
                iconAlignment: IconAlignment.end,
              )
            ],
          ),
        ),
        ),
    );
  }
}