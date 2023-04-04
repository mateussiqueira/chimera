import 'package:design_system/design_system.dart';
import 'package:learning/learning.dart';

import '../../../../styles/learning_module_style.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key? key,
    required this.isCourseFinished,
    required this.onStarPressed,
    required this.score,
  }) : super(key: key);

  final int? score;
  final bool isCourseFinished;
  final Function(int) onStarPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i < 6; i++)
          GestureDetector(
            onTap: () => onStarPressed(i),
            child: star(i, context),
          ),
      ],
    );
  }

  RatingStyle? getStyle(BuildContext context) {
    return context.resolveStyle<RatingStyle>();
  }

  Widget star(int i, BuildContext context) {
    Color? color = isCourseFinished
        ? getStyle(context)?.completedCourseColor ??
            moduleStyle.success.textModulePrimaryColor(context)
        : getStyle(context)?.defaultColor ??
            moduleStyle.quaternary.textModulePrimaryColor(context);
    if (i <= (score ?? 0)) {
      return Icons.star01Filled.iconCopyWith(size: Sizes.size20, color: color);
    } else {
      return Icons.star01.iconCopyWith(
        color: color,
        size: Sizes.size20,
      );
    }
  }
}
