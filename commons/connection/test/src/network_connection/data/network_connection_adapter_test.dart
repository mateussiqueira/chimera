import 'package:connection/connection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late NetworkConnectionAdapter sut;
  late ConnectivitySpy connectivity;

  setUp(() {
    connectivity = ConnectivitySpy();
    sut = NetworkConnectionAdapter.testFactory(connectivity: connectivity);
  });

  test('Should throw disconnected if connection returns none', () async {
    connectivity.mockCheckConnectivity(ConnectivityResult.none);
    final connection = await sut.getNetworkStatus();

    expect(connection, NetworkStatus.disconnected);
  });

  test('Should return wifi if connection returns Wi-Fi', () async {
    connectivity.mockCheckConnectivity(ConnectivityResult.wifi);
    final connection = await sut.getNetworkStatus();

    expect(connection, NetworkStatus.wifi);
  });

  test('Should return wifi if connection returns Ethernet', () async {
    connectivity.mockCheckConnectivity(ConnectivityResult.ethernet);
    final connection = await sut.getNetworkStatus();

    expect(connection, NetworkStatus.wifi);
  });

  test('Should return cellular if connection returns Bluetooth', () async {
    connectivity.mockCheckConnectivity(ConnectivityResult.bluetooth);
    final connection = await sut.getNetworkStatus();

    expect(connection, NetworkStatus.cellular);
  });

  test('Should return cellular if connection returns Mobile', () async {
    connectivity.mockCheckConnectivity(ConnectivityResult.mobile);
    final connection = await sut.getNetworkStatus();

    expect(connection, NetworkStatus.cellular);
  });
}
