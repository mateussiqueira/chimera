import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/pages/pages.dart';
import 'package:discovery/src/ui/pages/search/widgets/recent_searches_widget.dart';

import '../../styles/discovery_module_style.dart';
import '../../widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    Key? key,
    required this.presenter,
    this.query,
  }) : super(key: key) {
    presenter.init(query);
  }

  final String? query;
  final SearchPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(right: Sizes.size16),
          child: ListenableBuilder(
            listenable: presenter,
            builder: (context) {
              return SearchWidget(
                autofocus: query == null,
                onValueChange: (value) {
                  presenter.search = value;
                },
                onSearchPressed: presenter.isSearchEnabled
                    ? () => presenter.doSearch()
                    : null,
                value: presenter.search,
              );
            },
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: presenter,
        builder: (context) {
          final products = presenter.searchedProducts;

          if (query != null && products == null) {
            return const EmptyWidget();
          } else if (products != null && products.isNotEmpty) {
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
                      dividerColor: moduleStyle.secondary
                              .textModulePrimaryColor(context) ??
                          Colors.transparent,
                    ),
                  ),
                );
              },
              nextPage: () => presenter.nextPage(),
            );
          } else if (products != null) {
            return IllustrationImageWidget(
              image: Images.illustrationEmptyStateCourses,
              title: R.string.searchEmptyStateTitle,
              subTitle: R.string.searchEmptyStateSubtitle,
            );
          }
          return _defaultView;
        },
      ),
    );
  }

  Widget get _defaultView {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Sizes.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecentSearchesWidget(presenter: presenter),
          ListenableBuilder(
            listenable: presenter,
            builder: (context) {
              return ProductsGroupList(
                products: presenter.mostSearchedProducts,
                titleColor: moduleStyle.primary.textModulePrimaryColor(context),
                titleStyle: TypographyDisplayMd.bold(context).copyWith(
                  color: moduleStyle.primary.textModulePrimaryColor(context),
                ),
                groupTitle: R.string.mostSearched,
                onViewAll: () {},
                seeMoreTitle: '',
                seeAllEnabled: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
