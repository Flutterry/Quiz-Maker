import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._();
  static final _instance = AuthService._();
  factory AuthService.getInstance() => _instance;
  //--------------------

  final _auth = FirebaseAuth.instance;

  bool checkAuth() => _auth.currentUser != null;

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      BotToast.showSimpleNotification(
        title: 'Error! Try Again',
        subTitle: e.toString(),
      );
      return false;
    }
  }

  Future<bool> signUp(String userName, String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(userName);
      return true;
    } catch (e) {
      BotToast.showSimpleNotification(
        title: 'Error! Try Again',
        subTitle: e.toString(),
      );
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      BotToast.showText(text: e.toString());
      return false;
    }
  }
}
