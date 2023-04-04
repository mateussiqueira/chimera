import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/ui.dart';

import '../../../styles/discovery_module_style.dart';

class ProductSectionWidget extends StatelessWidget {
  const ProductSectionWidget({
    Key? key,
    required this.presenter,
    required this.products,
    required this.title,
    required this.categories,
    required this.onViewAll,
    required this.seeMoreTitle,
    required this.isFirstItem,
    required this.isLastItem,
  }) : super(key: key);

  final HomePresenter presenter;
  final ProductsEntity? products;
  final String title;
  final List<CategoryEntity>? categories;
  final VoidCallback onViewAll;
  final String seeMoreTitle;
  final bool isFirstItem;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    Widget section = Padding(
      padding: EdgeInsets.fromLTRB(
        Sizes.size16,
        isFirstItem ? Sizes.size16 : 0,
        Sizes.size16,
        isLastItem ? Sizes.size16 : Sizes.size40,
      ),
      child: ListenableBuilder(
        listenable: presenter,
        builder: (context) {
          return ProductsGroupList(
            products: products,
            groupTitle: title,
            seeMoreTitle: seeMoreTitle,
            onViewAll: onViewAll,
            seeMoreColor: isFirstItem
                ? moduleStyle.secondary.textModuleSecondaryColor(context)
                : null,
            titleColor: isFirstItem
                ? moduleStyle.secondary.textModulePrimaryColor(context)
                : null,
            categories: categories,
            onSelectCategory: (category) {
              return presenter.loadProductFromCategory(
                category,
              );
            },
            selectedCategory: presenter.selectedCategory,
          );
        },
      ),
    );
    if (isFirstItem) {
      return Stack(
        children: [
          Container(
              color:
                  moduleStyle.secondary.backgroundModulePrimaryColor(context),
              height: 150),
          section,
        ],
      );
    }
    return section;
  }
}
