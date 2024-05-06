import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen,{super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color:const Color.fromARGB(121, 255, 255, 255)
        ),
        const SizedBox(height: 40),
        Text(
          "Learn Flutter in a fun way!",
          style: GoogleFonts.lato(
            color: Colors.white
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: switchScreen,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right),
          label: const Text("Start Quiz"),
        )
      ]),
    );
  }
}
