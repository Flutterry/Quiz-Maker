import 'package:app3/src/application.dart';
import 'package:flutter/gestures.dart';

class CustomLastOnTapText extends StatelessWidget {
  final List<String> children;
  final void Function() onLastClick;
  const CustomLastOnTapText(
      {Key? key, required this.children, required this.onLastClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black54),
        children: [
          ...children
              .sublist(0, children.length - 1)
              .map((text) => TextSpan(text: text)),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onLastClick,
            text: children.last,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
