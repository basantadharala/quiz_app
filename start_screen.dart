import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Welcome to Quiz',
            style: GoogleFonts.barlowCondensed(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Image.asset(
            'assets/Quiz.png',
            height: 500,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_circle_right_sharp),
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
            label: const Text(
              'Start Quiz',
            ),
          ),

        ],
      ),
    );
  }
}
