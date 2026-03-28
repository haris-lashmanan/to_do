import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:todolist/utils/router.dart';

class NetworkConnectivityService {
  static final NetworkConnectivityService _instance =
      NetworkConnectivityService._internal();
  factory NetworkConnectivityService() => _instance;
  NetworkConnectivityService._internal();

  bool isConnected = true;

  Future<void> init() async {
    Connectivity().onConnectivityChanged.listen((results) {
      isConnected = !results.contains(ConnectivityResult.none);

      AppRouter.router.refresh();
    });
  }
}
