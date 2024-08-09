import 'package:ada_app_flutter/controller/login_controller.dart';
import 'package:ada_app_flutter/widgets/text_button_standard.dart';
import 'package:ada_app_flutter/widgets/outlined_button_standard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/person.dart';
import '../widgets/text_form_field_stardard.dart';

class SubscribeEmailPasswordScreen extends StatefulWidget {

  const SubscribeEmailPasswordScreen({ super.key });

  @override
  State<SubscribeEmailPasswordScreen> createState() => _SubscribeEmailPasswordScreenState();
}

class _SubscribeEmailPasswordScreenState extends State<SubscribeEmailPasswordScreen> {

  var email = TextEditingController();
  var password = TextEditingController();
  var passwordConfirm = TextEditingController();

  var formKey = GlobalKey<FormState>();
  
   @override
   Widget build(BuildContext context) {
        Person person = ModalRoute.of(context)!.settings.arguments as Person;

       return Scaffold(
           body: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email and Password',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Form (
                    key: formKey,
                    child: Column(
                      children: [
                        // 
                        // Input first name
                        // 
                        Textformfieldstardard(
                          controller: email,
                          labelText: 'Email',
                          validatorMessage: 'Type your email', 
                          prefixIcon: Icons.email_outlined,
                        ),
                        
                        const SizedBox(height: 15,),
                        // 
                        // Input email
                        // 
                        Textformfieldstardard(
                          controller: password,
                          labelText: 'Password',
                          validatorMessage: 'Type your password', 
                          prefixIcon: Icons.password_outlined,
                          obscureText: true,
                        ),

                        const SizedBox(height: 15,),

                        Textformfieldstardard(
                          controller: passwordConfirm,
                          labelText: 'Confirm your password',
                          validatorMessage: 'Type your password again',
                          prefixIcon: Icons.password,
                          obscureText: true,
                        ),
                        const SizedBox(height: 15,),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonStandard(text: 'Back', onPressed: (){
                        Navigator.pop(context);
                      }),
                      OutlinedButtonStandard(text: 'Subscribe', onPressed: (){
                        if(formKey.currentState!.validate()){
                            if(password.text == passwordConfirm.text){
                              print('equals password');
                              LoginController().createUserWithEmailAndPassword(
                                context, 
                                email.text, 
                                password.text, 
                                person.firstName,
                                person.lastName,
                                Timestamp.now(),
                                person.gender, 
                              );
                            }
                          }
                      }),
                    ],
                  )
                ],
              )
            )
          )
       );
  }
}