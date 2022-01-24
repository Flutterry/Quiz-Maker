import 'package:animate_do/animate_do.dart';
import 'package:app3/src/application.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late ResultProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<ResultProvider>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity, height: 16),
          BounceInLeft(
            child: CustomText(
              text: provider.percentResult,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 18),
          BounceInRight(
            child: CustomText(
              text: provider.stringResult,
              fontSize: 17,
              maxLines: 10,
              align: TextAlign.center,
            ),
          ),
          const SizedBox(height: 18),
          BounceInDown(
            child: CustomRoundedButton(
              label: 'Go To Home',
              onClick: () => pushClear(
                const HomeScreen(),
                HomeProvider(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
