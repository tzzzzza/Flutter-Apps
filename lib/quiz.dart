import 'package:basic_adv/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:basic_adv/start_screen.dart';
import 'package:basic_adv/models/questions.dart';
import 'package:basic_adv/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void restartStartScreen(){
    setState((){
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String ans){
    selectedAnswers.add(ans);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen'){
      screenWidget = QuestionScreen(onSelectedAnswer : chooseAnswer);
    }
    
    if(activeScreen == 'result-screen'){
      screenWidget = ResultScreen(selectedAnswers,restartQuiz: restartStartScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 62, 11, 125),
                Color.fromARGB(255, 166, 29, 150)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: screenWidget
        )
      ),
    );
  }
}