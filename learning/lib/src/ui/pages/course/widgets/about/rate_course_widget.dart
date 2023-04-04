import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../../styles/learning_module_style.dart';
import 'rating_course_style.dart';
import 'rating_widget.dart';

class RateCourseWidget extends StatelessWidget {
  const RateCourseWidget({
    Key? key,
    required this.isCourseFinished,
    required this.onStarPressed,
    required this.score,
  }) : super(key: key);

  final bool isCourseFinished;
  final int? score;
  final Function(int) onStarPressed;

  RatingCourseStyle? getStyle(BuildContext context) {
    return context.resolveStyle<RatingCourseStyle>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size16,
        vertical: Sizes.size04,
      ),
      color: isCourseFinished
          ? getStyle(context)?.completedCourseBackgroundColor ??
              moduleStyle.success.backgroundModulePrimaryColor(context)
          : getStyle(context)?.backgroundColor ??
              moduleStyle.primary.backgroundModuleTertiaryColor(context),
      child: Row(
        children: [
          TextWidget.textSmNormal(
            text: isCourseFinished
                ? R.string.rateFinishedCourse
                : R.string.rateCourse,
            style: TextStyle(
              color: isCourseFinished
                  ? getStyle(context)?.completedCourseTextColor ??
                      moduleStyle.success.textModulePrimaryColor(context)
                  : getStyle(context)?.textColor ??
                      moduleStyle.primary.textModulePrimaryColor(context),
            ),
          ),
          const Spacer(),
          RatingWidget(
            isCourseFinished: isCourseFinished,
            onStarPressed: onStarPressed,
            score: score,
          ),
        ],
      ),
    );
  }
}
