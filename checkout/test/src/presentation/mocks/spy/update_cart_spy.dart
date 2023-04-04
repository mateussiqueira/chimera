import 'package:checkout/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

class UpdateCartSpy extends Mock implements UpdateCart {
  When mockUpdateCall() => when(() => update(offerIds: any(named: 'offerIds')));

  void mockUpdate(CartEntity data) => mockUpdateCall().thenAnswer(
        (_) async => data,
      );

  void mockUpdateError() => mockUpdateCall().thenThrow(Exception());
}
