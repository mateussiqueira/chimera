import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';

class AssessmentPreviewWidget extends StatelessWidget {
  const AssessmentPreviewWidget({
    Key? key,
    required this.title,
    required this.numberOfAttemptsLeft,
  }) : super(key: key);

  final String title;
  final int? numberOfAttemptsLeft;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        const Positioned.fill(
          child: ImageWidget(
            image: Images.assessmentPlaceholder,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ResponsiveLayoutWidget(
              mobile: (context) {
                return pencilButton(context, 65, 16);
              },
              tablet: (context) {
                return pencilButton(context, 100, 28);
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveLayoutWidget(
                  mobile: (context) => const SpacingVertical.spacing16(),
                  tablet: (context) => const SpacingVertical.spacing40(),
                ),
                TextWidget.textMdBold(
                  text: title,
                  style: moduleStyle.secondary
                      .textModuleStyleWithPrimaryColor(context),
                ),
                const SpacingVertical.spacing04(),
                TextWidget.textSmMedium(
                  text: getAttemptsText(),
                  style: moduleStyle.secondary
                      .textModuleStyleWithSecondaryColor(context),
                ),
                ResponsiveLayoutWidget(
                  mobile: (context) => const SpacingVertical.spacing16(),
                  tablet: (context) => const SpacingVertical.spacing40(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  String getAttemptsText() {
    if ((numberOfAttemptsLeft ?? 0) <= 0) {
      return R.string.youHaveNoMoreAttempts;
    }
    if (numberOfAttemptsLeft == 1) {
      return R.string.touchToAnswerOneAttemptLeft;
    }
    return R.string.touchToAnswerAttemptsLeft(numberOfAttemptsLeft ?? 0);
  }

  Widget pencilButton(BuildContext context, double width, double padding) {
    return Container(
      width: width,
      height: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: moduleStyle.tertiary.backgroundModuleSecondaryColor(context),
        borderRadius: BorderRadius.circular(Sizes.size56),
      ),
      child: Icons.pencilLine.iconCopyWith(
        size: Sizes.size01,
        color: moduleStyle.tertiary.textModulePrimaryColor(context),
      ),
    );
  }
}
