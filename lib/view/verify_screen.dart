import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  late TextEditingController verification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    const Text('data'),
                    const Text('data'),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Number',
                      ),
                      controller: verification,
                    ),
                    OutlinedButton(onPressed: (){}, child: const Text('data')),
                    OutlinedButton(onPressed: (){}, child: const Text('teste'))
                  ],
                ),
              ),
      )
    );
  }
}