import 'package:checkout/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

class LoadCartSpy extends Mock implements LoadCart {
  When mockLoadCall() => when(() => load());

  void mockLoad(CartEntity data) => mockLoadCall().thenAnswer(
        (_) async => data,
      );

  void mockLoadError(Exception exception) =>
      mockLoadCall().thenThrow(exception);
}
