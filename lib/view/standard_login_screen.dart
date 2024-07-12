import 'package:flutter/material.dart';

class SubscribeScreen extends StatefulWidget {

  const SubscribeScreen({ super.key });

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  // Chave para o formulario
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
           body: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text('Create an account'),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder()
                          ),
                          validator: (String? value) {
                            return (value!.isEmpty) ? 'Do not use the @ char.' : null;
                          },
                        ),
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder()
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: (){}, 
                        child: const Text('Back')
                      ),
                      OutlinedButton(
                        onPressed: (){formKey.currentState!.validate();loginLoad();}, 
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