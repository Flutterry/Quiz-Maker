import 'package:animate_do/animate_do.dart';
import 'package:app3/src/application.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<SignUpProvider>();
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
                      validator: (value) => textValidation(value)
                          ? null
                          : 'Please enter valid Name',
                      decoration: const InputDecoration(hintText: 'Name'),
                      controller: provider.nameController,
                      keyboardType: TextInputType.text,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInDown(
                    delay: const Duration(milliseconds: 100),
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
                    delay: const Duration(milliseconds: 200),
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
                  const SizedBox(height: 16),
                  FadeInDown(
                    delay: const Duration(milliseconds: 300),
                    child: CustomRoundedButton(
                      label: 'Sign Up',
                      onClick: provider.signUp,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInDown(
                    delay: const Duration(milliseconds: 400),
                    child: CustomLastOnTapText(
                      children: const ['Already have an account ? ', 'Sign In'],
                      onLastClick: () {
                        pushClear(const SignInScreen(), SignInProvider());
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
