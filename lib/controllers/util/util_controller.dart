part of '../controllers.dart';

String appName = '';
String packageName = '';
String version = '';
String buildNumber = '';
String infoApps = '';
String contact = '';

class UtilController {
  void initPage() {
    infoApp();
    getUtils();
  }

  getUtils() async {
    UtilsModel result = await UtilsServiceLocal.get();

    infoApps = '${result.infoApps}\nVersion : $version';
    contact = result.contact;
  }

  infoApp() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}
