import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/home/widgets/widgets.dart';

class ProductGroupItemBuilder extends StatelessWidget with ScrollMixin {
  const ProductGroupItemBuilder({
    Key? key,
    required this.controller,
    required this.seeMoreTitle,
    required this.hasSeeMoreButton,
    required this.products,
    required this.onViewAll,
  }) : super(key: key);

  final ScrollController controller;
  final String seeMoreTitle;
  final bool hasSeeMoreButton;
  final ProductsEntity products;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      primary: false,
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final product in products.data) ...[
              if (product == products.data.last && hasSeeMoreButton) ...[
                if (hasSeeMoreButton)
                  GestureDetector(
                    onTap: () {
                      onViewAll.call();
                      scrollListToStart(controller: controller);
                    },
                    child: ProductSeeMoreWidget(
                      title: seeMoreTitle,
                    ),
                  ),
              ] else ...[
                ProductCardWidget(product: product),
                if (product != products.data.last)
                  const SpacingHorizontal.spacing16(),
              ]
            ]
          ],
        ),
      ),
    );
  }
}
