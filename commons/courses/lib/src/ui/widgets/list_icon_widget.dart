import 'package:design_system/design_system.dart';

import '../styles/courses_module_style.dart';
import 'list_icon_style.dart';

class ListIconWidget extends StatelessWidget {
  const ListIconWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final Icons icon;

  ListIconStyle? getStyle(BuildContext context) {
    return context.resolveStyle<ListIconStyle>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Sizes.size08),
          width: Sizes.size32,
          height: Sizes.size32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getStyle(context)?.iconBackgroundColor ??
                moduleStyle.secondary.backgroundModulePrimaryColor(context),
          ),
          child: icon.iconCopyWith(
            color: getStyle(context)?.iconColor ??
                moduleStyle.quaternary.textModulePrimaryColor(context),
          ),
        ),
        const SpacingHorizontal.spacing12(),
        Expanded(
          child: TextWidget.textMdNormal(
              text: text,
              style: TextStyle(
                color: getStyle(context)?.textColor ??
                    moduleStyle.tertiary.textModulePrimaryColor(context),
              )),
        ),
      ],
    );
  }
}
