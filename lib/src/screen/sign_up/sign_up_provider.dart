import 'package:app3/src/application.dart';
import 'package:bot_toast/bot_toast.dart';

class SignUpProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final authService = AuthService.getInstance();

  Future<void> signUp() async {
    if (formKey.currentState!.validate() == false) return;
    FocusScope.of(ContextService.context).requestFocus(FocusNode());

    BotToast.showLoading();
    if (await authService.signUp(
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    )) {
      BotToast.showText(text: 'Successful');
      pop();
    }
    BotToast.closeAllLoading();
  }
}
