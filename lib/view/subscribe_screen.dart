import 'package:ada_app_flutter/widgets/text_button_standard.dart';
import 'package:ada_app_flutter/widgets/outlined_button_standard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../model/person.dart';
import '../widgets/text_form_field_stardard.dart';

class SubscribeScreen extends StatefulWidget {

  const SubscribeScreen({ super.key });

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var birthDate = TextEditingController();

  var gender;

  List<bool> isChecked = [false, false, false];

  void clearChecked(){
    for (var i = 0; i < isChecked.length; i++) {
      isChecked[i] = false;
    }
  }
  
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      prefixIcon: Icons.person_outlined,
                    ),
                    
                    const SizedBox(height: 15,),
                    // 
                    // Input first name
                    // 
                    Textformfieldstardard(
                      controller: lastName,
                      labelText: 'Last Name',
                      validatorMessage: 'Type your last name', 
                      prefixIcon: Icons.person_outlined,
                    ),

                    const SizedBox(height: 15,),
                    // 
                    // Input first name
                    // 
                    Textformfieldstardard(
                      controller: birthDate,
                      labelText: 'Birth Date',
                      validatorMessage: 'Type your birth date', 
                      prefixIcon: Icons.cake_outlined,
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [MaskTextInputFormatter(mask: "##/##/####")],
                    ),
                    const SizedBox(height: 15,),
                    // 
                    // Input first name
                    // 
                    const Align(alignment: Alignment.centerLeft, child:  Text('Gender')),

                    Wrap(
                      children: [
                        CheckboxListTile(
                          title: const Text('cisgender'),
                          value: isChecked[0], 
                          onChanged: (bool? value) {
                            setState(() {
                              clearChecked();
                              isChecked[0] = value!;
                              gender = 'cisgender';
                            });
                          },
                        ),
                        CheckboxListTile(

                          title: const Text('transgender'),
                          value: isChecked[1], 
                          onChanged: (bool? value) {
                            setState(() {
                              clearChecked();
                              isChecked[1] = value!;
                              gender = 'transgender';
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('non-binary'),
                          value: isChecked[2], 
                          onChanged: (bool? value) {
                            setState(() {
                              clearChecked();
                              isChecked[2] = value!;
                              gender = 'non-binary';
                            });
                          },
                        ),
                      ],
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
                  OutlinedButtonStandard(text: 'Follow', onPressed: (){
                    if(formKey.currentState!.validate()){
                      
                      Person person = Person(
                        birthDate: Timestamp.now(),
                        firstName: firstName.text,
                        lastName: lastName.text,
                        gender: gender,
                      );

                      Navigator.pushNamed(
                        context, 
                        '/subscribe-email-password',
                        arguments: person,
                      );
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