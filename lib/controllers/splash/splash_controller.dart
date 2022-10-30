part of '../controllers.dart';

class SplashController {
  void initialPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const MainPage()),
      // );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const MainPage()),
          (Route<dynamic> route) => false);
    });
  }
}
