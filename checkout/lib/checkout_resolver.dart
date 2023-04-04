import 'package:checkout/src/ui/pages/pages.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import 'checkout_module.dart';

class CheckoutResolver implements MicroApp {
  @override
  String get name => 'cart';

  final module = CheckoutModule.initialize();

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          name: '/cart',
          builder: (context, args) => CartPage(
            presenter: module.get<CartPresenter>(),
            offerId: args as String?,
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/checkout',
          builder: (context, args) => CheckoutPage(
            presenter: module.get<CheckoutPresenter>(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
      ];

  @override
  void Function(Event event) get listener {
    return (event) {
      if (event is OpenCartEvent) {
        Route66.pushNamed(
          '/cart',
          arguments: event.offerId,
        );
      }
    };
  }
}
