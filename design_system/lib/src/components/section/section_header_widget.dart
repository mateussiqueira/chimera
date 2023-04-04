import 'package:design_system/design_system.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    Key? key,
    required this.title,
    this.titleColor,
    this.iconColor,
  }) : super(key: key);

  final String title;
  final Color? titleColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    BaseModuleStyle? resolvedStyle = tertiaryModuleStyle;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ImageWidget(
          image: Images.headerIcon,
          color: iconColor,
        ),
        const SizedBox(
          width: Sizes.size02,
        ),
        Expanded(
          child: TextWidget.displayMdBold(
            text: title,
            style: TextStyle(
              color:
                  titleColor ?? resolvedStyle.textModulePrimaryColor(context),
            ),
          ),
        ),
      ],
    );
  }
}
