import 'package:cart/src/ui/styles/cart_module_styles.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

abstract class CartController implements Listenable {
  Future<void> load();

  int get productsInCart;
}

class CartWidget extends StatelessWidget {
  CartWidget({
    Key? key,
    required this.controller,
  }) : super(key: key) {
    controller.load();
  }

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context) {
        int itemsLength = controller.productsInCart;
        if (itemsLength > 0) {
          return SizedBox(
            height: Sizes.size56,
            width: Sizes.size56,
            child: Stack(
              children: [
                Positioned(
                  bottom: Sizes.size00,
                  left: Sizes.size00,
                  child: SecondaryButton.icon2Xl(
                    icon: Icons.shoppingCart03,
                    onPressed: () {
                      Marcopolo().emit(BuyItemEvent(offerId: ''));
                    },
                  ),
                ),
                Positioned(
                  right: Sizes.size02,
                  top: Sizes.size00,
                  child: Container(
                    height: Sizes.size22,
                    width: Sizes.size22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          moduleStyle.tertiary.textModuleTertiaryColor(context),
                    ),
                    child: Center(
                      child: TextWidget.textXsBold(
                        text: '${controller.productsInCart}',
                        style: TextStyle(
                          color: moduleStyle.tertiary
                              .backgroundModulePrimaryColor(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
