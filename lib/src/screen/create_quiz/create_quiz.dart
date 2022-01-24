import 'package:animate_do/animate_do.dart';
import 'package:app3/src/application.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  late CreateQuizProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<CreateQuizProvider>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => pop(),
                child: const Icon(Icons.arrow_back_ios_rounded),
              ),
              const Expanded(child: CustomAppLogo()),
            ],
          ),
          const SizedBox(height: 16),
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
                          : 'Please enter valid Image Link',
                      decoration:
                          const InputDecoration(hintText: 'Quiz Image Url'),
                      controller: provider.imageController,
                      keyboardType: TextInputType.url,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInDown(
                    delay: const Duration(milliseconds: 100),
                    child: TextFormField(
                      validator: (value) => textValidation(value)
                          ? null
                          : 'Please enter valid title',
                      decoration: const InputDecoration(hintText: 'Quiz Title'),
                      controller: provider.titleController,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    child: TextFormField(
                      validator: (value) => textValidation(value)
                          ? null
                          : 'Please enter valid description',
                      decoration:
                          const InputDecoration(hintText: 'Quiz Description'),
                      controller: provider.descriptionController,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          const Spacer(),
          ElasticIn(
            child: CustomRoundedButton(
              label: 'Create Quiz',
              onClick: provider.createQuiz,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
