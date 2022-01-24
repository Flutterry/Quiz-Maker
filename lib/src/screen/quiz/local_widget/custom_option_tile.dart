import 'package:app3/src/application.dart';

class CustomOptionTile extends StatelessWidget {
  final String answer;
  final int index;
  final bool isCorrect, isSelected;
  final void Function() whenSelected;

  const CustomOptionTile({
    required this.answer,
    required this.index,
    required this.isCorrect,
    required this.isSelected,
    required this.whenSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenSelected,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: !isSelected
                    ? Colors.white
                    : isCorrect
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7),
                border: Border.all(
                  color: !isSelected
                      ? Colors.grey
                      : isCorrect
                          ? Colors.green.withOpacity(0.7)
                          : Colors.red.withOpacity(0.7),
                ),
              ),
              child: CustomText(
                text: String.fromCharCode('A'.codeUnitAt(0) + index),
                color: !isSelected ? Colors.grey : Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            CustomText(
              text: answer,
              color: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
