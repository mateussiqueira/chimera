import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';

class ExpandableFadeContentWidget extends StatelessWidget {
  const ExpandableFadeContentWidget({
    Key? key,
    required this.child,
    required this.title,
    this.showExpandButton = true,
  }) : super(key: key);

  final Widget child;
  final String title;
  final bool showExpandButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        IgnorePointer(
          child: child,
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.1,
                  1,
                ],
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black,
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget.textMdBold(
                  text: title,
                  style: moduleStyle.secondary
                      .textModuleStyleWithPrimaryColor(context),
                  textAlign: TextAlign.center,
                ),
                if (showExpandButton) expandButton(context),
                const SpacingVertical.spacing12(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget expandButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget.textSmMedium(
          text: R.string.expand,
          style:
              moduleStyle.secondary.textModuleStyleWithSecondaryColor(context),
        ),
        const SpacingHorizontal.spacing04(),
        Icons.chevronDown.iconCopyWith(
            color: moduleStyle.secondary.textModuleSecondaryColor(context)),
      ],
    );
  }
}
