part of '../controllers.dart';

class UtilController {
  String appName = '';
  String packageName = '';
  String version = '';
  String buildNumber = '';
  String infoApps = '';
  String contact = '';

  void initPage() {
    infoApp();
    getUtils();
  }

  getUtils() async {
    UtilsModel result = await UtilsServiceLocal.get();

    infoApps = result.infoApps + appName + packageName + version + buildNumber;
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
