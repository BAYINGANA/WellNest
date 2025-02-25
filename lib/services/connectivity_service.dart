import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Stream<bool> get connectionStatus async* {
    await for (final result in _connectivity.onConnectivityChanged) {
      yield result != ConnectivityResult.none;
    }
  }
}
