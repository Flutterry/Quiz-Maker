import '../controller_manager.dart';
import '../model/models.dart';

class QuizCreator {
  final quizController = Controller<Quiz>(Quiz.collectionName);

  Future<bool> create(Quiz quiz) async {
    try {
      if (quiz.id == null) {
        final quizRef = await quizController.insert(quiz);
        if (quizRef == null) return false;
        quiz.id = quizRef.id;
      }

      final questionController = Controller<Question>(
        Question.collectionName(quiz.id.toString()),
      );

      await Future.wait(
        quiz.questions.map((e) => questionController.insert(e)).toList(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
