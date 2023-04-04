import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/ui.dart';

class ProductWhoBoughtAlsoSawWidget extends StatelessWidget {
  const ProductWhoBoughtAlsoSawWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final ProductPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: presenter,
        builder: (context) {
          final products = presenter.productsUsersBought;
          if (products != null && products.data.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: Column(
                children: [
                  const SpacingVertical.spacing40(),
                  ProductsGroupList(
                    products: presenter.productsUsersBought,
                    groupTitle: R.string.whoBoughtAlsoView,
                    onViewAll: () {
                      Navigator.of(context, rootNavigator: true).pushNamed(
                        '/discovery/product-list/who-bought-also-view',
                        arguments: <String, dynamic>{
                          'title': R.string.whoBoughtAlsoView,
                          'params': presenter.productsUsersBoughtParams,
                        },
                      );
                    },
                    seeMoreTitle: R.string.seeMore,
                  ),
                ],
              ),
            );
          }
          return const EmptyWidget();
        });
  }
}
