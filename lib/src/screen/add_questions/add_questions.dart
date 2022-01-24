import 'package:animate_do/animate_do.dart';
import 'package:app3/src/application.dart';

class AddQuestionsScreen extends StatefulWidget {
  const AddQuestionsScreen({Key? key}) : super(key: key);

  @override
  State<AddQuestionsScreen> createState() => _AddQuestionsScreenState();
}

class _AddQuestionsScreenState extends State<AddQuestionsScreen> {
  late AddQuestionsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<AddQuestionsProvider>();
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Form(
                key: provider.formKey,
                child: CustomScrollableColumn(
                  children: [
                    FadeInDown(
                      child: TextFormField(
                        validator: (value) => textValidation(value)
                            ? null
                            : 'Please enter valid Question',
                        decoration: const InputDecoration(hintText: 'Question'),
                        controller: provider.questionController,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeInDown(
                      delay: const Duration(milliseconds: 100),
                      child: TextFormField(
                        validator: (value) => textValidation(value)
                            ? null
                            : 'Please enter valid option',
                        decoration: const InputDecoration(
                            hintText: 'Option1 (Correct Answer)'),
                        controller: provider.answerController,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeInDown(
                      delay: const Duration(milliseconds: 200),
                      child: TextFormField(
                        validator: (value) => textValidation(value)
                            ? null
                            : 'Please enter valid option',
                        decoration: const InputDecoration(hintText: 'Option2'),
                        controller: provider.option2Controller,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeInDown(
                      delay: const Duration(milliseconds: 300),
                      child: TextFormField(
                        validator: (value) => textValidation(value)
                            ? null
                            : 'Please enter valid option',
                        decoration: const InputDecoration(hintText: 'Option3'),
                        controller: provider.option3Controller,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeInDown(
                      delay: const Duration(milliseconds: 400),
                      child: TextFormField(
                        validator: (value) => textValidation(value)
                            ? null
                            : 'Please enter valid option',
                        decoration: const InputDecoration(hintText: 'Option4'),
                        controller: provider.option4Controller,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElasticIn(
                    child: CustomRoundedButton(
                      label: 'Submit',
                      onClick: provider.submit,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElasticIn(
                    child: CustomRoundedButton(
                      label: 'Add Question',
                      onClick: provider.addQuestion,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
