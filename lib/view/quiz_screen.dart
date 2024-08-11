import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  final List<Question> questions = [
    Question(
      text: 'What is the first thing to do in case of an earthquake?',
      options: [
        'Run outside immediately.',
        'Seek shelter under a table.',
        'Stand near a window.',
        'Use the elevator to evacuate.',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'What should you do during a flood?',
      options: [
        'Stay in your car.',
        'Move to higher ground.',
        'Walk through floodwaters.',
        'Wait for rescue inside your home.',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'In the event of a wildfire, what is the safest action?',
      options: [
        'Stay inside your house.',
        'Evacuate immediately if advised.',
        'Turn on all the lights in your house.',
        'Wait until the fire is close to evacuate.',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'If you are caught in a tsunami, what should you do?',
      options: [
        'Run towards the shore to get a better view.',
        'Climb to higher ground or go inland.',
        'Stay in your house and wait for help.',
        'Drive away in your car as fast as possible.',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'What is the best way to protect yourself during a hurricane?',
      options: [
        'Board up windows and stay indoors.',
        'Go outside to secure loose objects.',
        'Drive to a nearby shelter as soon as the hurricane hits.',
        'Stand near windows to monitor the storm.',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      text: 'During a tornado, the safest place to be is?',
      options: [
        'In a car, driving away from the tornado.',
        'In a basement or interior room without windows.',
        'Outside in an open area.',
        'Near a window to watch the tornado.',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text:
          'What should you do if you are caught outside in a lightning storm?',
      options: [
        'Seek shelter under a tree.',
        'Lie flat on the ground.',
        'Get inside a car or a building.',
        'Hold metal objects for protection.',
      ],
      correctOptionIndex: 2,
    ),
    Question(
      text: 'How should you protect yourself from an avalanche?',
      options: [
        'Scream loudly to alert others.',
        'Try to outrun the avalanche.',
        'Move to the side and try to stay on top of the snow.',
        'Dig a hole and wait for it to pass.',
      ],
      correctOptionIndex: 2,
    ),
    Question(
      text: 'What is the safest action during a volcanic eruption?',
      options: [
        'Watch the eruption from a safe distance.',
        'Seek shelter indoors and avoid ashfall.',
        'Climb to the highest point possible.',
        'Drive as close as possible to the volcano.',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'What should you do during a landslide?',
      options: [
        'Run uphill away from the slide.',
        'Stay inside and wait for it to pass.',
        'Drive towards the landslide to escape.',
        'Stand still and wait for help.',
      ],
      correctOptionIndex: 0,
    ),
  ];

  QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Disaster Preparedness Quiz')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text('Question ${index + 1}: ${question.text}'),
            onTap: () => _showOptions(context, question),
          );
        },
      ),
    );
  }

  void _showOptions(BuildContext context, Question question) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(question.text),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: question.options.asMap().entries.map((entry) {
            int idx = entry.key;
            String option = entry.value;
            return ListTile(
              title: Text(option),
              onTap: () {
                bool isCorrect = idx == question.correctOptionIndex;
                Navigator.pop(context);
                _showAnswer(context, isCorrect);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showAnswer(BuildContext context, bool isCorrect) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(isCorrect ? 'Correct!' : 'Incorrect!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctOptionIndex,
  });
}
