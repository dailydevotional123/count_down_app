import 'package:connectivity_plus/connectivity_plus.dart';

import '../helpers/snak_bar_widget.dart';
import '../utils/log_utils.dart';

class InternetConnectivityHelper {
  ConnectivityResult? connectivityResult;

  Future<void> initConnectivity() async {
    final Connectivity connectivity = Connectivity();
    final ConnectivityResult result = await connectivity.checkConnectivity();

    connectivityResult = result;

    dp(msg: "Connectivity Result", arg: connectivityResult);
    // if (connectivityResult == ConnectivityResult.none) {
    //   showErrorSnackBarMessage(message: "No Internet Connection!");
    // }

    connectivity.onConnectivityChanged.listen((ConnectivityResult newResult) {
      connectivityResult = newResult;

      dp(msg: "Connectivity new  Result", arg: connectivityResult);
      if (connectivityResult == ConnectivityResult.none) {
        showErrorSnackBarMessage(message: "No Internet Connection!");
      } else {
        showSuccessSnackBarMessage(message: "Internet connection restored");
      }
    });
  }
}
