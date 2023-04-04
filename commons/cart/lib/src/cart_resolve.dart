import 'package:cart/src/cart_module.dart';
import 'package:cart/src/ui/widgets/cart/cart_widget.dart';
import 'package:checkout/checkout.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class CartResolve implements MicroApp {
  @override
  String get name => 'cart';

  final module = CartModule.initialize();

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          name: '/cart-button',
          builder: (context, args) => CartWidget(
            controller: module.get<CartController>(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
      ];

  @override
  void Function(Event event) get listener {
    return (event) async {
      if (event is BuyItemEvent ||
          event is OpenCartEvent ||
          event is UserLoggedInEvent ||
          event is UserLoggedOffEvent) {
        final controller = module.get<CartController>();
        await controller.load();
      } else if (event is UpdateCartItemsEvent) {
        final presenter = module.get<NotifierCartPresenter>();
        await presenter.addOfferToCart(offerId: event.offerId);

        final controller = module.get<CartController>();
        await controller.load();
      }
    };
  }
}
