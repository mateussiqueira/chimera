import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';
import 'package:discovery/src/ui/widgets/widgets.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    Key? key,
    required this.product,
    this.productTitleColor,
    this.productInstallmentsColor,
    this.productPriceColor,
    this.productDiscountPriceColor,
  }) : super(key: key);

  final ProductEntity product;
  final Color? productTitleColor;
  final Color? productInstallmentsColor;
  final Color? productPriceColor;
  final Color? productDiscountPriceColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(
        '/discovery/product',
        arguments: product,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(Sizes.size08),
            ),
            child: ProductImageWidget(
              product: product,
              height: 80,
              width: 125,
            ),
          ),
          const SpacingHorizontal.spacing12(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.textSmMedium(
                  text: product.name ?? '',
                  style: TextStyle(
                    color: productTitleColor ??
                        moduleStyle.primary.textModulePrimaryColor(context),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SpacingVertical.spacing04(),
                ProductPriceWidget(
                  product: product,
                  productTitleColor: productTitleColor,
                  productPriceColor: productPriceColor,
                  productInstallmentsColor: productInstallmentsColor,
                  productDiscountPriceColor: productDiscountPriceColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
