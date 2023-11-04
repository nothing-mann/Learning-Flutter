import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.restartQuiz, {super.key});
  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final noTotalQuestions = questions.length;
    final noCorrectAnswers = summaryData.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $noCorrectAnswers 0f $noTotalQuestions questions correctly',
            ),
            const SizedBox(
              height: 30,
            ),
            QuizSummary(summaryData),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: restartQuiz,
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
