import 'package:animate_do/animate_do.dart';
import 'package:app3/src/application.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            fontSize: 35,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: 'Quiz'),
            TextSpan(
              text: 'Maker',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
