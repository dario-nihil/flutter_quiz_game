import 'package:flutter/material.dart';

import 'package:quiz_game/start_screen.dart';

List<Color> colors = const [
  Color.fromARGB(255, 78, 13, 151),
  Color.fromARGB(255, 107, 15, 168)
];

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
