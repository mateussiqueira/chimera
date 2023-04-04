import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';

class ExtraMaterialButton extends StatelessWidget {
  const ExtraMaterialButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      style: CardStyle.light.copyWith(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size20,
        ),
      ),
      child: Row(
        children: [
          Icons.file06.iconCopyWith(
            color: moduleStyle.primary.textModulePrimaryColor(context),
          ),
          const SpacingHorizontal.spacing08(),
          TextWidget.textMdMedium(
            text: R.string.courseExtraMaterial,
            style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
          ),
        ],
      ),
    );
  }
}
