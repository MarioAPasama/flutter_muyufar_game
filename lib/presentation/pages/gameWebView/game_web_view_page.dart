part of '../pages.dart';

class GameWebViewPage extends StatefulWidget with WidgetsBindingObserver {
  final String url;
  const GameWebViewPage(this.url, {super.key});

  @override
  State<GameWebViewPage> createState() => _GameWebViewPageState();
}

class _GameWebViewPageState extends State<GameWebViewPage> {
  GameWebViewController gameWebViewController = GameWebViewController();
  @override
  void initState() {
    gameWebViewController.initPage(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.url);
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: gameWebViewController.key,
          // drawer: Drawer(
          //   width: 100,
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   child: Container(
          //     margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          //     decoration: BoxDecoration(
          //         color: Colors.black.withOpacity(0.8),
          //         borderRadius: BorderRadius.circular(18)),
          //     child: GestureDetector(
          //         onTap: () {
          //           Navigator.pop(context);
          //         },
          //         child: Center(
          //           child: SizedBox(
          //             height: 60,
          //             child: Column(
          //               children: [
          //                 // Image.asset(
          //                 //   Assets.icons.keluar.path,
          //                 //   scale: 2,
          //                 // ),
          //                 const SizedBox(height: 4),
          //                 const Text(
          //                   'Keluar',
          //                   style: TextStyle(color: Colors.white),
          //                 )
          //               ],
          //             ),
          //           ),
          //         )),
          //   ),
          // ),
          body: Stack(
            children: [
              InAppWebView(
                key: gameWebViewController.globalKey,
                initialUrlRequest: URLRequest(
                  // url: Uri.parse(
                  //     'http://kids.indopustakaplus.com/game/mari%20berhitung%20-%20hewan%20darat'),
                  url: Uri.parse(widget.url),
                ),
                initialOptions: options,
                onWebViewCreated: (InAppWebViewController controller) {
                  gameWebViewController.webViewController = controller;
                },
              ),
              //Drawer
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2, left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    WidgetsBinding.instance
                        .removeObserver(GameWebViewPage(widget.url));
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitUp]);
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: SystemUiOverlay.values);
                  },
                  child: SizedBox(
                    height: 60,
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ));
  }

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
          disableDefaultErrorPage: true, useHybridComposition: true),
      ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
          allowsAirPlayForMediaPlayback: true));
}
