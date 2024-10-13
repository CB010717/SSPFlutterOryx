import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnection {
  // Create a singleton instance
  static final NetworkConnection _instance = NetworkConnection._internal();
  factory NetworkConnection() => _instance;

  NetworkConnection._internal() {
    _connectivity = Connectivity();
    _connectionStatusController = StreamController<ConnectivityResult>.broadcast();
    _initConnectivity();
  }

  late Connectivity _connectivity;
  late StreamController<ConnectivityResult> _connectionStatusController;
  Stream<ConnectivityResult> get connectionStatusStream => _connectionStatusController.stream;

  // Method to initialize the connectivity check
  void _initConnectivity() {
    // Subscribe to connectivity changes
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> resultList) {
      // Check the first result in the list for simplicity.
      final ConnectivityResult result = resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
      _connectionStatusController.add(result);
    });
  }

  // Method to get the current connectivity status
  Future<ConnectivityResult> checkConnection() async {
    try {
      List<ConnectivityResult> resultList = await _connectivity.checkConnectivity();
      return resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
    } catch (e) {
      return ConnectivityResult.none;
    }
  }

  // Method to dispose the stream controller when no longer needed
  void dispose() {
    _connectionStatusController.close();
  }
}
