import 'package:app3/backend/controller_manager.dart';
import 'package:app3/backend/model/models.dart';
import 'package:app3/src/application.dart';
import 'package:bot_toast/bot_toast.dart';

class HomeProvider extends ChangeNotifier {
  final authService = AuthService.getInstance();

  bool isLoading = true;
  final quizzes = <Quiz>[];
  final quizController = Controller<Quiz>(Quiz.collectionName);

  HomeProvider() {
    _startLoadingQuizzes();
  }

  Future<void> logout() async {
    BotToast.showLoading();
    if (await authService.signOut()) {
      pushClear(const SplashScreen(), SplashProvider());
    }
    BotToast.closeAllLoading();
  }

  Future<void> _startLoadingQuizzes() async {
    final results = await quizController.get();
    isLoading = false;
    if (results == null) return notifyListeners();
    for (final doc in results.docs) {
      quizzes.add(Quiz.fromSnapshot(doc));
    }
    notifyListeners();
  }
}
