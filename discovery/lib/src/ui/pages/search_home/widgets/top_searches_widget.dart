import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../styles/discovery_module_style.dart';

class TopSearchesWidget extends StatelessWidget {
  const TopSearchesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget.displayMdBold(
          text: R.string.topSearches,
          style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
        ),
        const SpacingVertical.spacing08(),
        Wrap(
          runSpacing: Sizes.size06,
          spacing: Sizes.size06,
          children: topSearchesList
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(
                      '/discovery/search',
                      arguments: e,
                    );
                  },
                  child: BadgeWidget(
                    backgroundColor: moduleStyle.primary
                        .backgroundModuleSecondaryColor(context),
                    border: Border.all(
                      color: moduleStyle.primary
                              .backgroundModuleTertiaryColor(context) ??
                          Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                      Sizes.size16,
                    ),
                    child: TextWidget.textXsMedium(
                      text: e,
                      style: moduleStyle.primary
                          .textModuleStyleWithPrimaryColor(context),
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }

  List<String> get topSearchesList => [
        'Marketing',
        'Compliance',
        'Direito',
        'Gestão',
      ];
}
