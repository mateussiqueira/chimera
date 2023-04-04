import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/pages/search/search.dart';

import '../../../styles/discovery_module_style.dart';

class RecentSearchesWidget extends StatelessWidget {
  const RecentSearchesWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final SearchPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        final recentSearches = presenter.recentSearchesList;
        if (recentSearches != null && recentSearches.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget.displayMdBold(
                text: R.string.recentSearches,
                style: moduleStyle.primary
                    .textModuleStyleWithPrimaryColor(context),
              ),
              const SpacingVertical.spacing08(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: Sizes.size56),
                child: Wrap(
                  clipBehavior: Clip.hardEdge,
                  verticalDirection: VerticalDirection.down,
                  runSpacing: Sizes.size06,
                  spacing: Sizes.size06,
                  children:
                      recentSearches.map((e) => _badge(e, context)).toList(),
                ),
              ),
              const SpacingVertical.spacing24(),
            ],
          );
        }
        return const EmptyWidget();
      },
    );
  }

  Widget _badge(String title, BuildContext context) {
    return BadgeWidget(
      backgroundColor:
          moduleStyle.primary.backgroundModuleSecondaryColor(context),
      border: Border.all(
        color: moduleStyle.primary.backgroundModuleTertiaryColor(context) ??
            Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(
        Sizes.size16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: TextWidget.textXsMedium(
              text: title,
              style:
                  moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
            ),
            onTap: () {
              presenter.search = title;
              presenter.doSearch();
            },
          ),
          const SpacingHorizontal.spacing04(),
          GestureDetector(
            onTap: () {
              presenter.removeSearch(title);
            },
            child: Icons.xClose.iconCopyWith(
              size: 10,
              color: moduleStyle.primary.textModuleTertiaryColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
