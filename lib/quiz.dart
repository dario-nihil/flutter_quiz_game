import 'package:flutter/material.dart';
import 'package:quiz_game/data/questions.dart';
import 'package:quiz_game/questions_screen.dart';

import 'package:quiz_game/start_screen.dart';

List<Color> colors = const [
  Color.fromARGB(255, 78, 13, 151),
  Color.fromARGB(255, 107, 15, 168)
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void choosedAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      selectedAnswers = [];
      setState(() {
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(choosedAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
