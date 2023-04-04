import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';
import 'package:discovery/src/ui/widgets/widgets.dart';

import 'product_list.dart';

class ProductList extends StatelessWidget {
  ProductList({
    super.key,
    required this.title,
    required this.presenter,
    required LoadProductsParams params,
  }) {
    presenter.init(params);
  }

  final String title;
  final ProductListPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: SecondaryAppBarWidget(title: title),
      body: ListenableBuilder(
        listenable: presenter,
        builder: (context) {
          final products = presenter.products;

          if (products != null) {
            return PaginationListWidget(
              itemCount: products.length,
              padding: const EdgeInsets.all(
                Sizes.size16,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCardWidget(product: product);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                  ),
                  child: HorizontalDividerWidget(
                    style: HorizontalDividerStyle(
                      dividerColor: moduleStyle.primary
                          .backgroundModuleTertiaryColor(context),
                    ),
                  ),
                );
              },
              nextPage: () => presenter.nextPage(),
            );
          }
          return const EmptyWidget();
        },
      ),
    );
  }
}
