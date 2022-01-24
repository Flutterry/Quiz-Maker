import 'package:app3/backend/controller_manager.dart';
import 'package:app3/backend/model/models.dart';
import 'package:app3/src/application.dart';

class QuizProvider extends ChangeNotifier {
  bool isLoading = true;
  final Quiz quiz;

  int total = 0;
  int correct = 0;
  int incorrect = 0;
  int get notAttempted => total - (correct + incorrect);

  QuizProvider(this.quiz) {
    loadQuizQuestions();
  }

  Future<void> loadQuizQuestions() async {
    quiz.questions.clear();
    notifyListeners();
    final questionController = Controller(
      Question.collectionName(quiz.id.toString()),
    );
    final questions = await questionController.get();
    if (questions == null) return pop();

    for (final doc in questions.docs) {
      quiz.questions.add(Question.fromSnapshot(doc));
    }
    isLoading = false;
    total = quiz.questions.length;
    notifyListeners();
  }

  void checkAnswer(Question question, String? answer) {
    question.selectedOption = answer;
    if (question.selectedOption == question.correctAnswer) {
      correct++;
    } else {
      incorrect++;
    }
    notifyListeners();
  }
}
