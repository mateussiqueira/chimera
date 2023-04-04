import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';

import '../styles/discovery_module_style.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({
    Key? key,
    required this.product,
    this.productTitleColor,
    this.productInstallmentsColor,
    this.productDiscountPriceColor,
    this.productPriceColor,
  }) : super(key: key);

  final ProductEntity product;
  final Color? productTitleColor;
  final Color? productInstallmentsColor;
  final Color? productDiscountPriceColor;
  final Color? productPriceColor;

  @override
  Widget build(BuildContext context) {
    final offer = product.availableOffers?.first;
    final maxInstallments = offer?.maxInstallments;
    if (offer != null && maxInstallments != null) {
      final hasDiscount = offer.price?.cents != offer.referencePrice?.cents;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWidget.textMdBold(
                text: R.string.installmentsPrice(
                  maxInstallments.times ?? 0,
                  maxInstallments.total?.cents ?? 0,
                  maxInstallments.total?.currencyIso ?? 'BRL',
                ),
                style: TextStyle(
                  color: productInstallmentsColor ??
                      moduleStyle.tertiary.textModuleTertiaryColor(context),
                ),
              ),
              const SpacingHorizontal.spacing08(),
              if (hasDiscount)
                TextWidget.textSmNormal(
                  text: R.string.price(
                    offer.referencePrice?.cents ?? 0,
                    offer.referencePrice?.currencyIso ?? 'BRL',
                  ),
                  style: TextStyle(
                    color: productDiscountPriceColor ??
                        moduleStyle.primary.textModuleSecondaryColor(context),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
          TextWidget.textXsNormal(
            text: R.string.cashPrice(
              offer.referencePrice?.cents ?? 0,
              offer.referencePrice?.currencyIso ?? 'BRL',
            ),
            style: TextStyle(
              color: productPriceColor ??
                  moduleStyle.primary.textModuleSecondaryColor(context),
            ),
          ),
        ],
      );
    }

    return const EmptyWidget();
  }
}
