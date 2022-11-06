part of '../controllers.dart';

class SplashController {
  UtilController utilController = UtilController();

  void initialPage(BuildContext context) {
    utilController.initPage();
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
