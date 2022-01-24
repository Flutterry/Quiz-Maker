import 'package:app3/backend/model/quiz.dart';
import 'package:app3/src/application.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomQuizTile extends StatelessWidget {
  final Quiz quiz;

  const CustomQuizTile(this.quiz, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => push(const QuizScreen(), QuizProvider(quiz)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: quiz.image.toString(),
                width: getWidth(100),
                height: getHeight(20),
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
                placeholder: (context, url) => Container(
                  width: getWidth(100),
                  height: getHeight(20),
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: SpinKitThreeBounce(color: Colors.white),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                CustomText(
                  text: quiz.name,
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 4),
                CustomText(
                  text: quiz.description,
                  color: Colors.white,
                  fontSize: 25,
                  align: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
