import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questions,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where(
          (element) => element['user_answer'] == element['correct_answer'],
    )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.barlowCondensed(
                color: const Color.fromARGB(255, 3, 11, 12),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            QuestionsSummary(summaryData:summaryData),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: onRestart,
              label: const Text('Restart'),
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 2, 6, 12),
                  backgroundColor: const Color.fromARGB(255, 228, 237, 241),
                  padding:const EdgeInsets.all(10),
                  textStyle:const TextStyle(fontSize: 20)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
