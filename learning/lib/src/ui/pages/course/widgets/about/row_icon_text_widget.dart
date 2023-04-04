import 'package:design_system/design_system.dart';

import '../../../../styles/learning_module_style.dart';
import 'row_icon_text_style.dart';

class RowIconTextWidget extends StatelessWidget {
  const RowIconTextWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Icons icon;
  final String text;

  RowIconTextStyle? getStyle(BuildContext context) {
    return context.resolveStyle<RowIconTextStyle>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon.iconCopyWith(
          color: getStyle(context)?.iconColor ??
              moduleStyle.quaternary.textModulePrimaryColor(context),
        ),
        const SpacingHorizontal.spacing08(),
        TextWidget.textMdNormal(
          text: text,
          style: TextStyle(
            color: getStyle(context)?.textColor ??
                moduleStyle.primary.textModulePrimaryColor(context),
          ),
        ),
      ],
    );
  }
}
