import 'package:app3/src/application.dart';
import 'package:bot_toast/bot_toast.dart';

class SignInProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final authService = AuthService.getInstance();

  Future<void> signIn() async {
    if (formKey.currentState!.validate() == false) return;
    FocusScope.of(ContextService.context).requestFocus(FocusNode());

    BotToast.showLoading();
    if (await authService.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    )) {
      pushClear(const HomeScreen(), HomeProvider());
    }
    BotToast.closeAllLoading();
  }
}
