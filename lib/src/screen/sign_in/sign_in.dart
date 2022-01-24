import 'package:animate_do/animate_do.dart';
import 'package:app3/src/application.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<SignInProvider>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          const CustomAppLogo(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Form(
              key: provider.formKey,
              child: Column(
                children: [
                  FadeInDown(
                    child: TextFormField(
                      validator: (value) => emailValidation(value)
                          ? null
                          : 'Please enter valid email',
                      decoration: const InputDecoration(hintText: 'Email'),
                      controller: provider.emailController,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInDown(
                    delay: const Duration(milliseconds: 100),
                    child: TextFormField(
                      validator: (value) => passwordValidation(value)
                          ? null
                          : 'Please enter valid password',
                      decoration: const InputDecoration(hintText: 'Password'),
                      controller: provider.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    child: CustomRoundedButton(
                        onClick: provider.signIn, label: 'Sign In'),
                  ),
                  const SizedBox(height: 8),
                  FadeInDown(
                    delay: const Duration(milliseconds: 300),
                    child: CustomLastOnTapText(
                      children: const ["Don't have an account ? ", "Sign Up"],
                      onLastClick: () {
                        push(const SignUpScreen(), SignUpProvider());
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
