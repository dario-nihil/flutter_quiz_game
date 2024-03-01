class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> get shuffledAnswers {
    final shuffledList = [...answers];
    shuffledList.shuffle();

    return shuffledList;
  }

  // List<String> getShuffledAnswers() {
  //   final shuffledList = [...answers];
  //   shuffledList.shuffle();

  //   return shuffledList;
  // }
}
