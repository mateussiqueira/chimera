import 'package:courses/src/ui/styles/courses_module_style.dart';
import 'package:design_system/design_system.dart';

import 'list_dot_style.dart';

class ListDotWidget extends StatelessWidget {
  const ListDotWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  ListDotStyle? getStyle(BuildContext context) {
    return context.resolveStyle<ListDotStyle>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: Sizes.size08),
          width: Sizes.size10,
          height: Sizes.size10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getStyle(context)?.dotColor ??
                moduleStyle.quaternary.textModulePrimaryColor(context),
          ),
        ),
        const SpacingHorizontal.spacing12(),
        Expanded(
          child: TextWidget.textSmNormal(
            text: text,
            style: TextStyle(
              color: getStyle(context)?.textColor ??
                  moduleStyle.tertiary.textModulePrimaryColor(context),
            ),
          ),
        ),
      ],
    );
  }
}
