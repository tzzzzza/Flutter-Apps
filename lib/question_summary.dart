import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_adv/question_identifier.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                QuestionIndentifier(questionIndex: data["question_index"] as int, isCorrectAnswer: data["correct_answer"] == data["user_answer"]),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data["question"] as String,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.fredoka(
                              fontSize: 15, color: Colors.white)),
                      Text(data["correct_answer"] as String,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.fredoka(
                              fontSize: 15, color: Colors.grey)),
                      Text(data["user_answer"] as String,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.fredoka(
                              fontSize: 15, color: Colors.blue)),
                    ],
                  ),
                ),
              ]);
            }).toList(),
          ),
        ));
  }
}
