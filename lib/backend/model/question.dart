import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller_manager.dart';

class Question extends Model {
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? correctAnswer;
  String? selectedOption;

  static String collectionName(String quizId) => 'Quiz/$quizId/Questions';

  Question({
    this.question,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
  });

  factory Question.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map? ?? {};
    final model = Question();
    model.id = snapshot.id;
    model.question = data["question"];
    final answers = [
      data["option1"],
      data["option2"],
      data["option3"],
      data["option4"],
    ]..shuffle();

    model.option1 = answers[0];
    model.option2 = answers[1];
    model.option3 = answers[2];
    model.option4 = answers[3];

    model.correctAnswer = data["option1"];

    return model;
  }

  @override
  Map<String, dynamic> toMap() => {
        if (question != null) 'question': question,
        if (option1 != null) 'option1': option1,
        if (option2 != null) 'option2': option2,
        if (option3 != null) 'option3': option3,
        if (option4 != null) 'option4': option4,
      };
}
