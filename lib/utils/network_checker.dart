import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> get hasInternet async {
  List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet) ||
      connectivityResult.contains(ConnectivityResult.vpn)) {
    return true;
  } else {
    return false;
  }
}
