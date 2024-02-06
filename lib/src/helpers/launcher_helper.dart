import 'package:url_launcher/url_launcher.dart';

import '../utils/log_utils.dart';

class LaunchHelper {
  void launchAction(String action, String value) async {
    String url;

    switch (action) {
      case 'phone':
        url = 'tel:$value';
        break;
      case 'whatsapp':
        url = 'whatsapp://send?phone=$value';
        break;
      case 'email':
        url = 'mailto:$value';
        break;
      case 'web':
        url = value;
        break;
      default:
        throw 'Invalid action';
    }

    // if (await canLaunchUrl(Uri.parse(url))) {

    try {
      await launchUrl((Uri.parse(url)));
    } on Exception catch (e) {
      dp(msg: "catch", arg: e.toString());
      // TODO
    }
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}
