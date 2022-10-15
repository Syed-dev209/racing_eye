import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  static InternetService _internetServices = InternetService._internal();
  factory InternetService() {
    return _internetServices;
  }
  InternetService._internal();

  static Future<bool> checkConnectivity() async {
    var connection = await (Connectivity().checkConnectivity());
    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      return true;
    } else {
      await Future.delayed(Duration(seconds: 2));
      connection = await (Connectivity().checkConnectivity());
      return (connection == ConnectivityResult.mobile ||
              connection == ConnectivityResult.wifi)
          ? true
          : false;
    }
  }
}
