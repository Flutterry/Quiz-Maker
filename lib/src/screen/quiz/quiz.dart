import 'package:animate_do/animate_do.dart';
import 'package:app3/src/application.dart';
import 'package:app3/src/screen/quiz/local_widget/local_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<QuizProvider>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          const CustomAppLogo(),
          if (provider.isLoading)
            const Expanded(
              child: Center(
                child: SpinKitCircle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          const SizedBox(height: 8),
          if (!provider.isLoading)
            Expanded(
              child: Column(
                children: [
                  CustomScrollableRow(
                    children: [
                      const SizedBox(width: 8),
                      CustomRowText(provider.total, 'Total', 0),
                      const SizedBox(width: 8),
                      CustomRowText(provider.correct, 'Correct', 100),
                      const SizedBox(width: 8),
                      CustomRowText(provider.incorrect, 'Incorrect', 200),
                      const SizedBox(width: 8),
                      CustomRowText(
                          provider.notAttempted, 'Not Attempted', 300),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      itemBuilder: (context, i) {
                        return i > 4
                            ? CustomQuestionTile(
                                provider.quiz.questions[i],
                                i + 1,
                              )
                            : FadeInUp(
                                delay: Duration(
                                  milliseconds: 200 * i,
                                ),
                                child: CustomQuestionTile(
                                  provider.quiz.questions[i],
                                  i + 1,
                                ),
                              );
                      },
                      itemCount: provider.quiz.questions.length,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushReplacement(
            const ResultScreen(),
            ResultProvider(provider.total, provider.correct),
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
