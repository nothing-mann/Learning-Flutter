import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.switchScreen, {super.key});
  final void Function() switchScreen;

  // void buttonPressed() {
  //   //......
  // }
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Learn Flutter the Fun Way!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: switchScreen,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 5,
                bottom: 5,
              ),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
