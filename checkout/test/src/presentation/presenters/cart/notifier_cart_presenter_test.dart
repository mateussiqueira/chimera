import 'package:checkout/src/data/data.dart';
import 'package:checkout/src/domain/domain.dart';
import 'package:checkout/src/presentation/presentation.dart';
import 'package:dependencies/dependencies.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../data/mocks/mocks.dart';
import '../../mocks/spy/spy.dart';

main() {
  late NotifierCartPresenter sut;
  late LoadCartSpy loadCart;
  late UpdateCartSpy updateCart;

  late CartEntity cartProductsLoad;
  late CartEntity cartProductsUpdate;

  setUp(() {
    loadCart = LoadCartSpy();
    updateCart = UpdateCartSpy();

    cartProductsLoad =
        RemoteCartModel.fromJson(mockCartLoadValidData).toEntity();
    cartProductsUpdate =
        RemoteCartModel.fromJson(mockCartUpdateValidData).toEntity();

    sut = NotifierCartPresenter(
      loadCart: loadCart,
      updateCart: updateCart,
    );

    loadCart.mockLoad(cartProductsLoad);
    updateCart.mockUpdate(cartProductsUpdate);
  });

  test('Should call Load with correct values', () async {
    await sut.load();

    verify(() => loadCart.load()).called(1);
  });

  test('Should notify listeners on Load success', () async {
    await sut.load();

    expect(sut.productsInCart, cartProductsLoad);
  });
}
