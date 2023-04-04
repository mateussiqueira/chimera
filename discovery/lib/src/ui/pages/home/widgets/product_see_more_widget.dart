import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/styles/discovery_module_style.dart';

class ProductSeeMoreWidget extends StatelessWidget {
  const ProductSeeMoreWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      padding: const EdgeInsets.all(Sizes.size16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size16),
        gradient: RadialGradient(
          colors: [
            moduleStyle.secondary.backgroundModulePrimaryColor(context) ??
                Colors.transparent,
            moduleStyle.secondary.backgroundModuleSecondaryColor(context) ??
                Colors.transparent,
          ],
          focal: const Alignment(1, 0.59),
          radius: 1,
          stops: const [
            0,
            1,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icons.grid01.iconCopyWith(
            color: moduleStyle.secondary.textModulePrimaryColor(context),
          ),
          const SpacingVertical.spacing12(),
          TextWidget.displayMdMedium(
            text: title,
            style:
                moduleStyle.secondary.textModuleStyleWithPrimaryColor(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
