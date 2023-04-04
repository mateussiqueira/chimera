import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/ui.dart';

import '../../../styles/discovery_module_style.dart';

class ProductPriceAddToCartWidget extends StatelessWidget {
  const ProductPriceAddToCartWidget({
    Key? key,
    required this.product,
    this.isFixed = false,
  }) : super(key: key);

  final ProductEntity? product;
  final bool isFixed;

  @override
  Widget build(BuildContext context) {
    final product = this.product;
    if (product != null) {
      return Container(
        decoration: _decoration(context),
        padding: const EdgeInsets.all(Sizes.size16),
        child: SafeArea(
          child: Row(
            children: [
              ProductPriceWidget(product: product),
              const Spacer(),
              _buttons,
            ],
          ),
        ),
      );
    }
    return const EmptyWidget();
  }

  BoxDecoration? _decoration(BuildContext context) {
    if (isFixed) {
      return BoxDecoration(
        color: moduleStyle.primary.backgroundModuleSecondaryColor(context),
        boxShadow: Shadows.shadowMd,
      );
    }
    return null;
  }

  Widget get _buttons {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TertiaryButton.sizeMd(
            text: R.string.buyCourse,
            onPressed: () {
              final offerId = product?.availableOffers?.firstOrNull?.id;
              if (offerId != null) {
                Marcopolo().emit(BuyItemEvent(offerId: offerId));
              }
            },
          ),
        ),
        Flexible(
          child: LinkButton.sizeMd(
            text: R.string.addToCart,
            onPressed: () {
              final offerId = product?.availableOffers?.firstOrNull?.id;
              if (offerId != null) {
                Marcopolo().emit(UpdateCartItemsEvent(offerId));
              }
            },
          ),
        ),
      ],
    );
  }
}
