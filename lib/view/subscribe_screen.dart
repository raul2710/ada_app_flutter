import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../widgets/textformfield_stardard.dart';

class SubscribeScreen extends StatefulWidget {

  const SubscribeScreen({ super.key });

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var birthDate = TextEditingController();
  var email = TextEditingController();
  var formKey = GlobalKey<FormState>();

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create an account',
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
                          controller: firstName,
                          labelText: 'First Name',
                          validatorMessage: 'Type your first name', 
                          prefixIcon: Icons.person,
                        ),
                        
                        const SizedBox(height: 15,),
                        // 
                        // Input first name
                        // 
                        Textformfieldstardard(
                          controller: lastName,
                          labelText: 'Last Name',
                          validatorMessage: 'Type your last name', 
                          prefixIcon: Icons.person,
                        ),

                        const SizedBox(height: 15,),
                        // 
                        // Input first name
                        // 
                        Textformfieldstardard(
                          controller: birthDate,
                          labelText: 'Birth Date',
                          validatorMessage: 'Type your birth date', 
                          prefixIcon: Icons.cake,
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [MaskTextInputFormatter(mask: "##/##/####")],
                        ),
                        const SizedBox(height: 15,),
                        // 
                        // Input first name
                        // 
                        Textformfieldstardard(
                          controller: email,
                          labelText: 'Email',
                          validatorMessage: 'Type your email', 
                          prefixIcon: Icons.email,
                        ),
                        const SizedBox(height: 15,),
                      ],
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
                            // LoginController().createUserWithEmailAndPassword(
                            //   context,
                            //   email.toString(),
                            //   password.toString()
                            // );
                          };
                        }, 
                        child: const Text('Continue')
                      )
                    ],
                  )
                ],
              )
            )
          )
       );
  }
}