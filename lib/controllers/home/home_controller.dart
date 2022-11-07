part of '../controllers.dart';

class HomeController {
  void onTapinfoApp(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ShowDialogUtil(
            title: 'Info Apps', content: infoApps, activeactionButton: false));
  }

  void onTapContact(BuildContext context) async {
    if (await canLaunchUrl(Uri.parse('https://wa.me/$contact'))) {
      launchUrl(Uri.parse('https://wa.me/$contact'),
          mode: LaunchMode.externalApplication);
    } else {
      showDialog(
          context: context,
          builder: (context) => const ShowDialogUtil(
              title: 'Error',
              content: 'Whatsapp Error',
              activeactionButton: false));
    }
  }
}
