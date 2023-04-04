import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

@visibleForTesting
class ConnectivitySpy extends Mock implements Connectivity {
  When get mockCheckConnectivityCall => when(
        () => checkConnectivity(),
      );

  void mockCheckConnectivity(ConnectivityResult result) =>
      mockCheckConnectivityCall.thenAnswer(
        (_) async => result,
      );

  void mockCheckConnectivitySuccess() => mockCheckConnectivityCall.thenAnswer(
        (_) async => ConnectivityResult.wifi,
      );

  void mockCheckConnectivityError() => when(
        () => mockCheckConnectivityCall.thenThrow(Exception()),
      );
}
