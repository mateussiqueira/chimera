import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../styles/courses_module_style.dart';

class AssessmentContentWidget extends StatelessWidget {
  const AssessmentContentWidget({
    super.key,
    required this.content,
    required this.model,
    required this.onClickContent,
    required this.isSelected,
    required this.title,
  });

  final LocalAssessmentHelperModel model;
  final Function(ContentEntity content) onClickContent;
  final ContentEntity content;
  final bool isSelected;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClickContent.call(content),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? context
                      .resolveStyle<AccordionStyle>()
                      ?.backgroundRowSelectedColor ??
                  moduleStyle.primary.backgroundModulePrimaryColor(context)
              : moduleStyle.primary.backgroundModuleSecondaryColor(context),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(
              Sizes.size16,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacings.spacing16,
            vertical: Spacings.spacing12,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: title,
                  ),
                  if (canRenderAssessmentInfo) ...[
                    const SpacingHorizontal.spacing08(),
                    TextWidget.textXsNormal(
                      text: remainingText(),
                      style: TextStyle(
                        color: remainingColor(context),
                      ),
                    ),
                  ],
                ],
              ),
              if (canRenderAssessmentInfo) ...[
                const SpacingVertical.spacing12(),
                Container(
                  padding: const EdgeInsets.all(Spacings.spacing08),
                  decoration: BoxDecoration(
                    color: moduleStyle.tertiary
                        .backgroundModulePrimaryColor(context),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        Sizes.size16,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      item(
                        Icons.clock,
                        context,
                        R.string
                            .minutesContraction(model.durationInMinutes ?? 180),
                        color: moduleStyle.tertiary
                            .textModulePrimaryColor(context),
                      ),
                      item(
                        Icons.clipboardCheck,
                        context,
                        '${model.minScore ?? 70}%',
                        color: moduleStyle.tertiary
                            .textModulePrimaryColor(context),
                      ),
                      item(
                        Icons.clipboard,
                        context,
                        scoreText(),
                        bold: isBold(),
                        color: scoreColor(context) ?? Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  bool get canRenderAssessmentInfo {
    final duration = model.durationInMinutes;
    final score = model.score;
    final minScore = model.minScore;
    return duration != null && score != null && minScore != null;
  }

  Widget item(
    Icons icon,
    BuildContext context,
    String text, {
    bool bold = false,
    Color? color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon.iconCopyWith(
          color: moduleStyle.tertiary.textModulePrimaryColor(context),
        ),
        const SpacingHorizontal.spacing04(),
        bold
            ? TextWidget.textXsBold(
                text: text,
                style: TextStyle(color: color),
              )
            : TextWidget.textXsNormal(
                text: text,
                style: TextStyle(color: color),
              )
      ],
    );
  }

  int remaining() {
    return model.remaining ?? 0;
  }

  String scoreText() {
    if (model.score == null) {
      return '--';
    }
    return '${model.score ?? 0}%';
  }

  bool isBold() {
    return model.score != null;
  }

  Color? scoreColor(BuildContext context) {
    if (model.score == null) {
      return moduleStyle.tertiary.textModulePrimaryColor(context);
    }
    int score = model.score!;
    int minScore = model.minScore ?? 0;
    if (score >= minScore) {
      return moduleStyle.success.textModulePrimaryColor(context);
    }
    return moduleStyle.danger.textModulePrimaryColor(context);
  }

  String remainingText() {
    if (remaining() > 1) {
      return R.string.attemptsLeft(remaining());
    }
    return R.string.attemptLeft(remaining());
  }

  Color? remainingColor(BuildContext context) {
    if (remaining() == 1) {
      return moduleStyle.danger.textModulePrimaryColor(context);
    }
    return moduleStyle.tertiary.textModulePrimaryColor(context);
  }
}
