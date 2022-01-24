import 'package:app3/backend/controller/quiz_creator.dart';
import 'package:app3/backend/model/models.dart';
import 'package:app3/src/application.dart';
import 'package:bot_toast/bot_toast.dart';

class AddQuestionsProvider extends ChangeNotifier {
  final Quiz quiz;
  AddQuestionsProvider(this.quiz);

  final questions = <Question>[];

  final formKey = GlobalKey<FormState>();
  final questionController = TextEditingController();
  final answerController = TextEditingController();
  final option2Controller = TextEditingController();
  final option3Controller = TextEditingController();
  final option4Controller = TextEditingController();

  final quizCreator = QuizCreator();

  Future<void> submit() async {
    if (questions.isEmpty) {
      BotToast.showText(text: 'Please add some questions first');
      return;
    }

    BotToast.showLoading();
    quiz.questions = [...questions];
    if (await quizCreator.create(quiz)) {
      pushClear(const HomeScreen(), HomeProvider());
    }
    BotToast.closeAllLoading();
  }

  void addQuestion() {
    if (formKey.currentState!.validate() == false) return;
    questions.add(
      Question()
        ..question = questionController.text.trim()
        ..option1 = answerController.text.trim()
        ..option2 = option2Controller.text.trim()
        ..option3 = option3Controller.text.trim()
        ..option4 = option4Controller.text.trim(),
    );

    questionController.clear();
    answerController.clear();
    option2Controller.clear();
    option3Controller.clear();
    option4Controller.clear();

    BotToast.showText(text: 'Added ✌');
  }
}
