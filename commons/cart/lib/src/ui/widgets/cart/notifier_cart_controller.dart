import 'dart:async';

import 'package:cart/src/ui/widgets/cart/cart.dart';
import 'package:checkout/checkout.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class NotifierCartController extends NotifierUpdatePresenter
    implements CartController {
  NotifierCartController({
    required this.loadCart,
    required this.userIsLoggedIn,
  });

  final LoadCart loadCart;
  final UserIsLoggedIn userIsLoggedIn;

  int _productsInCart = 0;

  @override
  Future<void> load() async {
    try {
      final isLogged = await userIsLoggedIn.verify();

      if (isLogged) {
        CartEntity result = await loadCart.load();
        _productsInCart = result.offers?.length ?? 0;
      } else if (isLogged == false) {
        _productsInCart = 0;
      }

      update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
  }

  @override
  int get productsInCart => _productsInCart;
}
