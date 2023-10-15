class QuizQuestion {
  const QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> shuffledList() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
