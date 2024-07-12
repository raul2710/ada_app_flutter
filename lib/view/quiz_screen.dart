import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weekly Questionnaire')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Question 1'),
            subtitle:
                Text('What is the first thing to do in case of an earthquake?'),
            onTap: () => _showAnswer(context, 'Seek shelter under a table.'),
          ),
          // Adicione outras perguntas aqui
        ],
      ),
    );
  }

  void _showAnswer(BuildContext context, String answer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(answer),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
