part of '../controllers.dart';

class GameWebViewController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final GlobalKey globalKey = GlobalKey();
  late InAppWebViewController webViewController;

  void initPage(url) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    WidgetsBinding.instance.addObserver(GameWebViewPage(url));
  }
}
