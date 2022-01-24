import 'package:app3/src/application.dart';

class ResultProvider extends ChangeNotifier {
  final int total;
  final int correct;
  ResultProvider(this.total, this.correct);

  String get percentResult => '${(correct / total * 100).toInt()}%';
  String get stringResult =>
      'You Have Answered $correct Question Correctly \n From $total Questions';
}
