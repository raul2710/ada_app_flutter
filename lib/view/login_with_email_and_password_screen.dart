import 'package:ada_app_flutter/controller/login_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/FlatButtonStandard.dart';
import '../widgets/OutlinedButtonStandard.dart';
import '../widgets/textformfield_stardard.dart';

class LoginWithEmailAndPasswordScreen extends StatefulWidget {

  const LoginWithEmailAndPasswordScreen({ super.key });

  @override
  State<LoginWithEmailAndPasswordScreen> createState() => _LoginWithEmailAndPasswordScreenState();
}

class _LoginWithEmailAndPasswordScreenState extends State<LoginWithEmailAndPasswordScreen> {
  // Chave para o formulario
  // https://medium.com/firebase-developers/patterns-for-security-with-firebase-per-user-permissions-for-cloud-firestore-be67ee8edc4a
  var formKey = GlobalKey<FormState>();

  var email = TextEditingController();
  var password = TextEditingController();

  void loginLoad(){  
    if(formKey.currentState!.validate()){
      LoginController().signInWithEmailAndPassword(
        context,
        email.toString(),
        password.toString()
      );
    }
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          //  appBar: AppBar(title: const Text(''),),
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
                        prefixIcon: Icons.email,
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
                    onPressed: (){},
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
                )
                 
               ],
             )
           )
       );
  }
}