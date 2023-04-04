import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';

import '../../../../styles/learning_module_style.dart';

class CourseCategoriesWidget extends StatelessWidget {
  const CourseCategoriesWidget({
    Key? key,
    this.categories,
  }) : super(key: key);

  final List<CategoryEntity>? categories;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.size04,
      runSpacing: Sizes.size04,
      direction: Axis.horizontal,
      clipBehavior: Clip.hardEdge,
      children: [
        if (categories != null)
          for (final category in categories!)
            BadgeWidget(
              backgroundColor:
                  moduleStyle.tertiary.backgroundModulePrimaryColor(context),
              child: TextWidget.textSmMedium(
                text: category.name ?? '',
                style: moduleStyle.tertiary
                    .textModuleStyleWithPrimaryColor(context),
              ),
            ),
      ],
    );
  }
}
