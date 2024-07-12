import 'package:flutter/material.dart';

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
                  TextFormField(
                    controller: firstName,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder()
                    ),
                  ),  
                  TextFormField(
                    controller: lastName,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder()
                    ),
                  ),
                  TextFormField(
                    controller: birthDate,
                    decoration: InputDecoration(
                      labelText: 'Birth Date',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder()
                    ),
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()
                    ),
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child: const Text('Back')
                      ),
                      OutlinedButton(
                        onPressed: (){}, 
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