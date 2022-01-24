import 'package:app3/backend/model/question.dart';
import 'package:app3/src/application.dart';
import 'package:app3/src/screen/quiz/local_widget/local_widgets.dart';

class CustomQuestionTile extends StatelessWidget {
  final Question question;
  final int questionNumber;

  const CustomQuestionTile(this.question, this.questionNumber, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = context.read<QuizProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Q$questionNumber. ${question.question}',
            maxLines: 300,
            fontSize: 18,
          ),
          ...[
            question.option1,
            question.option2,
            question.option3,
            question.option4
          ].asMap().entries.map(
                (e) => CustomOptionTile(
                  answer: e.value.toString(),
                  index: e.key,
                  isCorrect: e.value == question.correctAnswer,
                  isSelected: question.selectedOption != null &&
                      question.selectedOption == e.value,
                  whenSelected: () {
                    if (question.selectedOption == null) {
                      provider.checkAnswer(question, e.value);
                    }
                  },
                ),
              )
        ],
      ),
    );
  }
}
