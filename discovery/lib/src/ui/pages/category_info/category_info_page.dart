import 'dart:math';

import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';

import '../../widgets/widgets.dart';
import 'category_info.dart';

class CategoryInfoPage extends StatelessWidget {
  CategoryInfoPage({
    super.key,
    required this.presenter,
    required this.category,
  }) {
    presenter.init(category);
  }

  final CategoryEntity category;
  final CategoryInfoPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  moduleStyle.secondary
                          .backgroundModuleQuaternaryColor(context) ??
                      Colors.transparent,
                  moduleStyle.secondary.backgroundModulePrimaryColor(context) ??
                      Colors.transparent,
                ],
                stops: const [0.0, 0.2],
                transform: const GradientRotation(pi),
              ),
            ),
          ),
        ),
        const ImageWidget(
          image: Images.categoryBackground,
          fit: BoxFit.fitHeight,
        ),
        Positioned.fill(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool _) {
              return <Widget>[
                SliverAppBar(
                  centerTitle: true,
                  title: TextWidget.textMdBold(
                    text: R.string.categories,
                    style: moduleStyle.secondary
                        .textModuleStyleWithPrimaryColor(context),
                    textAlign: TextAlign.center,
                  ),
                  leading: BackButtonWidget(
                    iconColor: moduleStyle.secondary
                        .textModuleQuaternaryColor(context),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      const SpacingVertical.spacing32(),
                      _icon.iconCopyWith(
                        color: moduleStyle.secondary
                            .textModuleSecondaryColor(context),
                        size: Sizes.size32,
                      ),
                      const SpacingVertical.spacing04(),
                      TextWidget.displayMdBold(
                        text: category.name ?? '',
                        style: moduleStyle.secondary
                            .textModuleStyleWithPrimaryColor(context),
                        textAlign: TextAlign.center,
                      ),
                      const SpacingVertical.spacing08(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size16,
                        ),
                        child: TextWidget.textSmNormal(
                          text: category.description ?? '',
                          style: moduleStyle.secondary
                              .textModuleStyleWithSecondaryColor(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SpacingVertical.spacing16(),
                    ],
                  ),
                ),
              ];
            },
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ListenableBuilder(
                    listenable: presenter,
                    builder: (context) {
                      final products = presenter.products;

                      if (products != null) {
                        return PaginationListWidget(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          padding: const EdgeInsets.all(
                            Sizes.size16,
                          ),
                          itemBuilder: (context, index) {
                            final product = products[index];

                            return ProductCardWidget(
                              product: product,
                              productTitleColor: moduleStyle.secondary
                                  .textModuleSecondaryColor(context),
                              productInstallmentsColor: moduleStyle.secondary
                                  .textModulePrimaryColor(context),
                              productPriceColor: moduleStyle.secondary
                                  .textModuleTertiaryColor(context),
                              productDiscountPriceColor: moduleStyle.secondary
                                  .textModuleTertiaryColor(context),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SpacingVertical.spacing24();
                          },
                          nextPage: () => presenter.nextPage(),
                        );
                      }
                      return const EmptyWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Icons get _icon {
    switch (category.slug) {
      case 'direito':
        return Icons.scales01;
      case 'economia':
        return Icons.coinsHand;
      case 'tecnologia':
        return Icons.lightBulb02;
      case 'negocios':
        return Icons.trendUp01;
      default:
        return Icons.graduationHat02;
    }
  }
}
