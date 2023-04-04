import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

@visibleForTesting
class NetworkConnectionSpy extends Mock implements NetworkConnection {
  NetworkConnectionSpy() {
    mockNetworkStatus(NetworkStatus.wifi);
  }
  When mockHasNetworkCall() => when(() => hasNetwork());

  void mockHasNetwork(bool data) =>
      mockHasNetworkCall().thenAnswer((_) async => data);

  When mockNetworkStatusCall() => when(() => getNetworkStatus());

  void mockNetworkStatus(NetworkStatus data) =>
      mockHasNetworkCall().thenAnswer((_) async => data);

  void mockNetworkStatusError() =>
      when(() => mockNetworkStatusCall().thenThrow(Exception()));
}
