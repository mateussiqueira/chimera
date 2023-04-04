import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

import '../domain/domain.dart';

class NetworkConnectionAdapter implements NetworkConnection {
  NetworkConnectionAdapter._({
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity() {
    try {
      _subscription = _connectivity.onConnectivityChanged.listen((result) {
        _updateNetworkStatus(result);
      });
    } catch (_) {}
  }

  factory NetworkConnectionAdapter() {
    return _instance ??= NetworkConnectionAdapter._();
  }

  @visibleForTesting
  factory NetworkConnectionAdapter.testFactory({
    Connectivity? connectivity,
  }) =>
      NetworkConnectionAdapter._(
        connectivity: connectivity,
      );

  static NetworkConnectionAdapter? _instance;
  late final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _subscription;

  NetworkStatus networkStatus = NetworkStatus.wifi;

  final _controller = StreamController<NetworkStatus>.broadcast();
  void _update() => _controller.add(networkStatus);

  @override
  Stream<NetworkStatus> get connectionStream =>
      _controller.stream.map((status) => status).distinct();

  Future<void> _updateNetworkStatus(ConnectivityResult result) async {
    final newStatus = _handleResponse(result);
    if (networkStatus != newStatus) {
      networkStatus = newStatus;
      _update();
    }
  }

  @override
  Future<bool> hasNetwork() async {
    try {
      final status = await getNetworkStatus();
      return status != NetworkStatus.disconnected;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<NetworkStatus> getNetworkStatus() async {
    try {
      final connection = await _connectivity.checkConnectivity();
      await _updateNetworkStatus(connection);
      return networkStatus;
    } catch (_) {
      throw NetworkStatus.disconnected;
    }
  }

  NetworkStatus _handleResponse(ConnectivityResult connection) {
    switch (connection) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.mobile:
        return NetworkStatus.cellular;
      case ConnectivityResult.ethernet:
      case ConnectivityResult.wifi:
        return NetworkStatus.wifi;
      default:
        return NetworkStatus.disconnected;
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.close();
  }
}
