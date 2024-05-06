class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffleAnswers(){
    final shuffleAnswer = List.of(answer);
    shuffleAnswer.shuffle();
    return shuffleAnswer;
  }
}