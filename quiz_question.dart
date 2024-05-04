class QuizQuestion {
  const QuizQuestion(
      this.questions,
      this.answers,
      );

  final String questions;
  final List<String> answers;

  List<String> getShuffleAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}
