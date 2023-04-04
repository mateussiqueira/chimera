import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/home/home.dart';
import 'package:discovery/src/ui/pages/home/widgets/widgets.dart';

import '../../styles/discovery_module_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.presenter,
  });

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      body: ListenableBuilder(
        builder: (context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: false,
                snap: false,
                floating: false,
                collapsedHeight: 250,
                expandedHeight: 380,
                flexibleSpace: Stack(
                  children: [
                    Positioned.fill(
                      child: ColoredBox(
                        color: moduleStyle.secondary
                                .backgroundModulePrimaryColor(context) ??
                            Colors.transparent,
                      ),
                    ),
                    const Positioned.fill(
                      child: ImageWidget(
                        image: Images.homeBanner,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final item = _productsGroupList[index];
                    final categoryKey = R.string.navigateByCategory;
                    final isCategoryGroup = item.key == categoryKey;
                    final isFirstItem = index == 0;
                    final isLastItem = index == _productsGroupList.length - 1;

                    return ProductSectionWidget(
                      presenter: presenter,
                      products: item.value,
                      title: item.key,
                      categories: isCategoryGroup ? presenter.categories : null,
                      onViewAll: () {
                        final title = isCategoryGroup
                            ? presenter.selectedCategory?.name
                            : item.key;

                        if (isCategoryGroup) {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            '/discovery/category-info',
                            arguments: presenter.selectedCategory,
                          );
                        } else {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            '/discovery/product-list',
                            arguments: <String, dynamic>{
                              'title': title,
                              'params': _groupParams[item.key],
                            },
                          );
                        }
                      },
                      seeMoreTitle: _seeMoreTitle(item.key),
                      isFirstItem: isFirstItem,
                      isLastItem: isLastItem,
                    );
                  },
                  childCount: _productsGroupList.length,
                ),
              ),
            ],
          );
        },
        listenable: presenter,
      ),
    );
  }

  List<MapEntry<String, ProductsEntity?>> get _productsGroupList {
    return _productsGroup.entries.where((group) {
      final productsEntity = group.value;
      return productsEntity != null && productsEntity.data.isNotEmpty;
    }).toList();
  }

  Map<String, ProductsEntity?> get _productsGroup => {
        R.string.recentViewed: presenter.recentViewedProducts,
        R.string.mostSearched: presenter.mostSearchedProducts,
        R.string.navigateByCategory: presenter.selectedCategoryProducts,
      };

  Map<String, LoadProductsParams> get _groupParams => {
        R.string.recentViewed: presenter.recentViewedParams,
        R.string.mostSearched: presenter.mostSearchedParams,
        R.string.navigateByCategory: presenter.selectedCategoryParams,
      };

  String _seeMoreTitle(String key) {
    if (key == R.string.recentViewed) {
      return R.string.seeAllRecentViewed;
    } else if (key == R.string.mostSearched) {
      return R.string.seeAllMostSearched;
    } else if (key == R.string.navigateByCategory) {
      final category = presenter.selectedCategory;
      final name = category?.shortName ?? category?.name ?? '';
      return R.string.seeAllCategory(name);
    } else if (key == R.string.likedCourses) {
      return R.string.seeAllLiked;
    }
    return '';
  }
}
