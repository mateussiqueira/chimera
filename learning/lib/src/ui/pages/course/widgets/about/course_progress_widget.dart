import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/course/course.dart';

import '../../../../styles/learning_module_style.dart';
import 'course_progress_style.dart';

class CourseProgressWidget extends StatelessWidget {
  const CourseProgressWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final CoursePresenter presenter;

  bool get completed => presenter.courseCompleted;

  CourseProgressStyle? getStyle(BuildContext context) {
    return context.resolveStyle<CourseProgressStyle>();
  }

  Color? backgroundColor(BuildContext context) {
    return completed
        ? getStyle(context)?.completedCourseBackgroundColor ??
            moduleStyle.quaternary.textModulePrimaryColor(context)
        : getStyle(context)?.backgroundColor ??
            moduleStyle.secondary.textModulePrimaryColor(context);
  }

  Color? titleColor(BuildContext context) {
    return completed
        ? getStyle(context)?.completedCourseTitleColor ??
            moduleStyle.tertiary.textModuleSecondaryColor(context)
        : getStyle(context)?.titleColor ??
            moduleStyle.tertiary.textModulePrimaryColor(context);
  }

  Color? textProgressColor(BuildContext context) {
    return completed
        ? getStyle(context)?.completedCourseTextProgressColor ??
            moduleStyle.tertiary.textModulePrimaryColor(context)
        : getStyle(context)?.textProgressColor ??
            moduleStyle.primary.textModulePrimaryColor(context);
  }

  Color? iconColor(BuildContext context) {
    return completed
        ? getStyle(context)?.completedCourseIconColor ??
            moduleStyle.tertiary.textModulePrimaryColor(context)
        : getStyle(context)?.iconColor ??
            moduleStyle.quaternary.textModulePrimaryColor(context);
  }

  Color? textColor(BuildContext context) {
    return completed
        ? getStyle(context)?.completedCourseTextColor ??
            moduleStyle.tertiary.textModulePrimaryColor(context)
        : getStyle(context)?.textColor ??
            moduleStyle.primary.textModulePrimaryColor(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        return CardWidget(
          style: CardStyle.light.copyWith(
            padding: const EdgeInsets.all(Sizes.size16),
            backgroundColor: backgroundColor(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget.displayMdBold(
                text: completed
                    ? R.string.courseCompleted
                    : R.string.courseProgress,
                style: TextStyle(
                  color: titleColor(context),
                ),
              ),
              const SpacingVertical.spacing12(),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressBarWidget(
                      progress: presenter.coursePercentage,
                    ),
                  ),
                  const SpacingHorizontal.spacing12(),
                  TextWidget.textSmMedium(
                    text: "${(presenter.coursePercentage * 100).ceil()}%",
                    style: TextStyle(
                      color: textProgressColor(context),
                    ),
                  ),
                ],
              ),
              const SpacingVertical.spacing08(),
              _progressItem(
                Icons.checkCircle,
                R.string.courseLessonProgress(
                  presenter.totalDoneLessons,
                  presenter.totalLessons,
                ),
                completed,
                context,
              ),
              const SpacingVertical.spacing08(),
              _progressItem(
                Icons.clockFastForward,
                R.string.courseLastActivity(presenter.lastActivity),
                completed,
                context,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _progressItem(
      Icons icon, String text, bool courseCompleted, BuildContext context) {
    return Row(
      children: [
        icon.iconCopyWith(
          color: iconColor(context),
        ),
        const SpacingHorizontal.spacing04(),
        TextWidget.textXsNormal(
          text: text,
          style: TextStyle(
            color: textColor(context),
          ),
        ),
      ],
    );
  }
}
