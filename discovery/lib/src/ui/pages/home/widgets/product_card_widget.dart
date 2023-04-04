import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/widgets/widgets.dart';

import '../../../styles/discovery_module_style.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(
        '/discovery/product',
        arguments: product,
      ),
      child: SizedBox(
        width: 300,
        child: CardWidget(
          style: CardStyle.light.copyWith(
            padding: EdgeInsets.zero,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Sizes.size16),
                ),
                child: ProductImageWidget(
                  product: product,
                  height: 125,
                  width: 300,
                ),
              ),
              const SpacingVertical.spacing12(),
              _productName(context),
              const SpacingVertical.spacing08(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size04),
                child: HorizontalDividerWidget(
                  style: HorizontalDividerStyle(
                    dividerColor: moduleStyle.primary
                            .backgroundModuleTertiaryColor(context) ??
                        Colors.transparent,
                  ),
                ),
              ),
              const SpacingVertical.spacing08(),
              _contentPadding(
                children: [
                  ProductPriceWidget(product: product),
                ],
              ),
              const SpacingVertical.spacing12(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productName(BuildContext context) {
    return _contentPadding(
      children: [
        Wrap(
          children: [
            ...?product.categories
                ?.map(
                  (e) => BadgeWidget(
                    backgroundColor: moduleStyle.tertiary
                        .backgroundModulePrimaryColor(context),
                    child: TextWidget.textXsMedium(
                      text: e.shortName ?? e.name ?? '',
                      style: moduleStyle.tertiary
                          .textModuleStyleWithSecondaryColor(context),
                      maxLines: 2,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
        const SpacingVertical.spacing08(),
        TextWidget.displayMdMedium(
          text: product.name ?? '',
          maxLines: 2,
          style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
        ),
      ],
    );
  }

  Widget _contentPadding({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
