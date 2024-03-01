import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_game/data/questions.dart';
import 'package:quiz_game/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.choosenAnwser, this.onRestart, {super.key});

  final void Function() onRestart;
  final List<String> choosenAnwser;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (var idx = 0; idx < choosenAnwser.length; idx++) {
      summary.add({
        'question_index': idx,
        'question': questions[idx].text,
        'correct_answer': questions[idx].answers[0],
        'user_answer': choosenAnwser[idx]
      });
    }

    return summary;
  }

  // List<Map<String, Object>> getSummaryData() {
  //   List<Map<String, Object>> summary = [];

  //   for (var idx = 0; idx < choosenAnwser.length; idx++) {
  //     summary.add({
  //       'question_index': idx,
  //       'question': questions[idx].text,
  //       'correct_answer': questions[idx].answers[0],
  //       'user_answer': choosenAnwser[idx]
  //     });
  //   }

  //   return summary;
  // }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answer $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(206, 237, 223, 252),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
