import 'package:app3/src/application.dart';
import 'package:app3/src/screen/home/local_widget/custom_quiz_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<HomeProvider>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              GestureDetector(
                onTap: provider.logout,
                child: const Icon(Icons.logout),
              ),
              const Expanded(child: CustomAppLogo()),
            ],
          ),
          Expanded(
            child: provider.isLoading
                ? const Center(
                    child: SpinKitCircle(color: Colors.blueAccent),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemBuilder: (context, i) =>
                        CustomQuizTile(provider.quizzes[i]),
                    itemCount: provider.quizzes.length,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => push(
          const CreateQuizScreen(),
          CreateQuizProvider(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
