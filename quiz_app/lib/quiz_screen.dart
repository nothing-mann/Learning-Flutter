import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  void nextIndex() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              // style: const TextStyle(
              //   fontWeight: FontWeight.w500,
              //   fontSize: 24,
              //   color: Colors.white,
              //
              style: GoogleFonts.tiltNeon(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            // ...currentQuestion.answers.map((items) {
            //   return AnswerButton(items, () {});
            // }

            ...currentQuestion.shuffledList().map((answers) {
              return AnswerButton(answers, nextIndex);
            })

            // AnswerButton(currentQuestion.answers[0], () {}),
            // AnswerButton(currentQuestion.answers[1], () {}),
            // AnswerButton(currentQuestion.answers[2], () {}),
            // AnswerButton(currentQuestion.answers[3], () {}),
          ],
        ),
      ),
    );
  }
}
