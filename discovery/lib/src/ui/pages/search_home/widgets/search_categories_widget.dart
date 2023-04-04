import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:discovery/src/ui/pages/pages.dart';

import '../../../styles/discovery_module_style.dart';

class SearchCategoriesWidget extends StatelessWidget {
  const SearchCategoriesWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final SearchHomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.displayMdBold(
          text: R.string.categories,
          style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
        ),
        const SpacingVertical.spacing08(),
        ListenableBuilder(
          builder: (context) {
            return GridView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Sizes.size08,
                crossAxisSpacing: Sizes.size08,
                mainAxisExtent: 80,
              ),
              itemCount: presenter.categories.length,
              itemBuilder: (BuildContext context, int index) {
                final category = presenter.categories[index];
                return _categoryCard(category, context);
              },
            );
          },
          listenable: presenter,
        ),
      ],
    );
  }

  Widget _categoryCard(CategoryEntity category, BuildContext context) {
    final image = category.media?.cardImage;

    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          '/discovery/category-info',
          arguments: category,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(Sizes.size04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size16),
          image: image != null
              ? DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    moduleStyle.secondary
                            .backgroundModulePrimaryColor(context)
                            ?.withOpacity(0.85) ??
                        Colors.transparent,
                    BlendMode.multiply,
                  ),
                  image: NetworkImageProvider(image),
                )
              : null,
        ),
        child: Center(
          child: TextWidget.displayMdMedium(
            text: category.shortName ?? category.name ?? '',
            style:
                moduleStyle.quaternary.textModuleStyleWithPrimaryColor(context),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
