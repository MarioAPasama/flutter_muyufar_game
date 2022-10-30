part of '../pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController().initialPage(context);
    return const Scaffold(
      body: Center(child: Text('')),
    );
  }
}
