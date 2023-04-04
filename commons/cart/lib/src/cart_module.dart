import 'package:cart/src/ui/widgets/cart/cart_widget.dart';
import 'package:cart/src/ui/widgets/cart/notifier_cart_controller.dart';
import 'package:checkout/checkout.dart';
import 'package:dependencies/dependencies.dart';

class CartModule {
  static final alligator = Alligator();

  static Alligator initialize() {
    alligator.register<CartController>(
      () => NotifierCartController(
        loadCart: alligator.get<LoadCart>(),
        userIsLoggedIn: alligator.get<UserIsLoggedIn>(),
      ),
      isSingleton: true,
    );

    alligator.register<CartWidget>(
      () => CartWidget(
        controller: alligator.get<CartController>(),
      ),
      isSingleton: true,
    );

    return alligator;
  }
}
