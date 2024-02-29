import 'package:flutter/material.dart';

import 'package:quiz_game/data/questions.dart';
import 'package:quiz_game/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.choosenAnwser, {super.key}) {
    print('choosenAnser length: ${choosenAnwser.length}');
  }

  final List<String> choosenAnwser;

  List<Map<String, Object>> getSummaryData() {
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

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
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
                'You answer $numCorrectQuestions out of $numTotalQuestions questions correctly'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
