import 'package:app3/src/application.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashProvider provider;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (AuthService.getInstance().checkAuth()) {
        pushClear(const HomeScreen(), HomeProvider());
      } else {
        pushClear(const SignInScreen(), SignInProvider());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = context.watch<SplashProvider>();
    return const Scaffold(
      body: Center(child: CustomAppLogo()),
    );
  }
}
