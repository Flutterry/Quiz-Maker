import 'package:app3/src/application.dart';

class CustomRoundedButton extends StatelessWidget {
  final String label;
  final void Function() onClick;

  const CustomRoundedButton(
      {Key? key, required this.label, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(85),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(180),
          ),
        ),
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: label,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
