import 'network_status.dart';

abstract class NetworkConnection {
  Stream<NetworkStatus> get connectionStream;
  Future<NetworkStatus> getNetworkStatus();
  Future<bool> hasNetwork();
  void dispose();
}
