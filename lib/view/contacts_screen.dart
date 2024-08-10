import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text('Coming soon...', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
        ),
      ),
    );
  }
}