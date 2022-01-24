import 'package:animate_do/animate_do.dart';
import 'package:app3/src/application.dart';

class CustomRowText extends StatelessWidget {
  final int count;
  final String label;
  final int delayed;
  const CustomRowText(this.count, this.label, this.delayed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInRight(
      delay: Duration(milliseconds: delayed),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(8),
              child: CustomText(
                text: count.toString(),
                color: Colors.white,
                align: TextAlign.center,
              ),
            ),
            Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(8),
              child: CustomText(
                text: label,
                color: Colors.white,
                align: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
