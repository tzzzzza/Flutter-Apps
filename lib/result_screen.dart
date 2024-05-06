import 'package:flutter/material.dart';
import 'package:basic_adv/question_summary.dart';
import 'package:basic_adv/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, {super.key, required this.restartQuiz});

  final void Function() restartQuiz;

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['correct_answer'] == data["user_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "The $correctAnswers answers of $totalQuestions is correct",
                textAlign: TextAlign.center,
                style: GoogleFonts.fredoka(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(height: 20),
              QuestionSummary(summaryData),
              const SizedBox(height: 20),
              TextButton.icon(
                  onPressed: restartQuiz,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightBlue),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text("Restart Quiz")),
            ]),
      ),
    );
  }
}
