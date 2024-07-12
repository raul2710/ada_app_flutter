import 'package:ada_app_flutter/controller/login_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/TextFormFieldStardard.dart';

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
      if (formKey.currentState!.validate());
    }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text(
                   'Login',
                   textAlign: TextAlign.left,
                   style: TextStyle(
                     fontSize: 30,
                      fontWeight: FontWeight.bold
                   ),
                 ),
                 const SizedBox(height: 15,),
                 Form(
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

                      const SizedBox(height: 15,),

                      // 
                      // Input Password
                      // 
                      Textformfieldstardard(
                        controller: password,
                        labelText: 'Password',
                        validatorMessage: 'Type your password', 
                        prefixIcon: Icons.password,
                        obscureText: true,
                      )
                     ],
                   ),
                 ),
                 const SizedBox(height: 15,),
                 
                 Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){}, 
                    child: const Text('Forget password?')
                  ),
                 ),
                 
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     OutlinedButton(
                       onPressed: (){
                        Navigator.pop(context);
                       }, 
                       child: const Text('Back')
                     ),
                     OutlinedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            LoginController().signInWithEmailAndPassword(
                              context,
                              email.toString(),
                              password.toString()
                            );
                          };
                        }, 
                       child: const Text('Continue')
                     )
                   ],
                 )
               ],
             )
           )
       );
  }
}