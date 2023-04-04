import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';
import 'package:discovery/src/ui/widgets/product_group/product_group.dart';

class ProductsGroupList extends StatelessWidget with ScrollMixin {
  ProductsGroupList({
    Key? key,
    required this.products,
    required this.groupTitle,
    required this.onViewAll,
    required this.seeMoreTitle,
    this.titleColor,
    this.seeMoreColor,
    this.categories,
    this.onSelectCategory,
    this.selectedCategory,
    this.titleStyle,
    this.seeAllEnabled = true,
  }) : super(key: key);

  final ProductsEntity? products;
  final String groupTitle;
  final String seeMoreTitle;
  final VoidCallback onViewAll;
  final Color? titleColor;
  final Color? seeMoreColor;
  final List<CategoryEntity>? categories;
  final Function(CategoryEntity)? onSelectCategory;
  final CategoryEntity? selectedCategory;
  final bool seeAllEnabled;
  final TextStyle? titleStyle;

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final products = this.products;
    if (products != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(context),
          _categories(context),
          const SpacingVertical.spacing20(),
          ProductGroupItemBuilder(
            controller: _controller,
            seeMoreTitle: seeMoreTitle,
            hasSeeMoreButton: hasSeeMoreButton,
            products: products,
            onViewAll: onViewAll,
          ),
        ],
      );
    }
    return const EmptyWidget();
  }

  Widget _title(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextWidget.displayLgBold(
            text: groupTitle,
            style: titleStyle ??
                TextStyle(
                  color: titleColor ??
                      moduleStyle.primary.textModulePrimaryColor(context),
                ),
          ),
        ),
        const SpacingHorizontal.spacing04(),
        if (hasSeeMoreButton) _viewAll(context),
      ],
    );
  }

  Widget _viewAll(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onViewAll.call();
        scrollListToStart(controller: _controller);
      },
      child: Row(
        children: [
          TextWidget.textXsNormal(
            text: R.string.seeAll,
            style: TextStyle(
              color: seeMoreColor ??
                  moduleStyle.primary.textModuleSecondaryColor(context),
            ),
          ),
          const SpacingHorizontal.spacing04(),
          Icons.chevronRight.iconCopyWith(
            color: seeMoreColor ??
                moduleStyle.primary.textModuleSecondaryColor(context),
          ),
        ],
      ),
    );
  }

  Widget _categories(BuildContext context) {
    final categories = this.categories;
    if (categories != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpacingVertical.spacing12(),
          SingleChildScrollView(
            primary: false,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: [
                for (final category in categories) ...[
                  GestureDetector(
                    onTap: () {
                      scrollListToStart(controller: _controller);
                      onSelectCategory?.call(category);
                    },
                    child: BadgeWidget(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size08,
                        vertical: Sizes.size04,
                      ),
                      border: Border.all(
                        color: moduleStyle.secondary
                                .backgroundModuleSecondaryColor(context) ??
                            Colors.transparent,
                      ),
                      backgroundColor: isSelected(category)
                          ? moduleStyle.tertiary
                              .textModuleSecondaryColor(context)
                          : Colors.transparent,
                      child: TextWidget.textSmNormal(
                        text: category.shortName ?? category.name ?? '',
                        style: TextStyle(
                          color: isSelected(category)
                              ? moduleStyle.secondary
                                  .textModulePrimaryColor(context)
                              : moduleStyle.tertiary
                                  .textModuleSecondaryColor(context),
                        ),
                      ),
                    ),
                  ),
                  if (categories.last != category)
                    const SpacingHorizontal.spacing08()
                ],
              ],
            ),
          ),
          const SpacingVertical.spacing04(),
        ],
      );
    }
    return const EmptyWidget();
  }

  bool isSelected(CategoryEntity category) {
    return category.slug == selectedCategory?.slug;
  }

  bool get hasSeeMoreButton =>
      seeAllEnabled && (products?.pagination?.totalItems ?? 0) > 3;
}
