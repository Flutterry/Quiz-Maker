import 'package:app3/backend/controller_manager.dart';
import 'package:app3/backend/model/models.dart';
import 'package:app3/src/application.dart';

class CreateQuizProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final imageController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final quizController = Controller<Quiz>(Quiz.collectionName);
  Future<void> createQuiz() async {
    if (formKey.currentState!.validate() == false) return;
    push(
      const AddQuestionsScreen(),
      AddQuestionsProvider(
        Quiz()
          ..image = imageController.text.trim()
          ..name = titleController.text.trim()
          ..description = descriptionController.text.trim(),
      ),
    );
  }
}
