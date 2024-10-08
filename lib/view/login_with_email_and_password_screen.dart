import 'package:ada_app_flutter/controller/login_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/text_button_standard.dart';
import '../widgets/outlined_button_standard.dart';
import '../widgets/text_form_field_stardard.dart';

class LoginWithEmailAndPasswordScreen extends StatefulWidget {

  const LoginWithEmailAndPasswordScreen({ super.key });

  @override
  State<LoginWithEmailAndPasswordScreen> createState() => _LoginWithEmailAndPasswordScreenState();
}

class _LoginWithEmailAndPasswordScreenState extends State<LoginWithEmailAndPasswordScreen> {
  var formKey = GlobalKey<FormState>();

  var email = TextEditingController();
  var password = TextEditingController();

  void loginLoad(){  
    if(formKey.currentState!.validate()){
      LoginController().signInWithEmailAndPassword(
        context,
        email.text,
        password.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login in with your email adress',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                // 
                // Input email
                // 
                Textformfieldstardard(
                  controller: email,
                  labelText: 'Email',
                  validatorMessage: 'Type your email',
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 25,),

                // 
                // Input Password
                // 
                Textformfieldstardard(
                  controller: password,
                  labelText: 'Password',
                  validatorMessage: 'Type your password', 
                  prefixIcon: Icons.password,
                  obscureText: true,
                ),
                
            const SizedBox(height: 5,),
            
            Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: (){LoginController().sendPasswordResetEmail(context, email.text);},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                foregroundColor: const Color(0xFF000000)
              ), 
              child: const Text('Forget password?'),
            ),
            ),
            
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButtonStandard(
                text: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
                ),
                TextButtonStandard(
                  text: "Login", 
                  onPressed: loginLoad,
                )
              ],
            ),
            ],
              ),
            ),
          )],
        )
      )
    );
  }
}