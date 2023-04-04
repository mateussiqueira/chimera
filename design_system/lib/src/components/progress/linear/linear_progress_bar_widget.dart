import 'package:design_system/design_system.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearProgressBarWidget extends StatelessWidget {
  const LinearProgressBarWidget({
    Key? key,
    required this.progress,
    this.center,
    this.style,
  }) : super(key: key);

  final double progress;
  final Widget? center;
  final LinearProgressBarStyle? style;

  LinearProgressBarStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<LinearProgressBarStyle>();
    return style ?? resolvedStyle ?? LinearProgressBarStyle.light;
  }

  @override
  Widget build(BuildContext context) {
    TertiaryModuleStyle? resolvedStyle = tertiaryModuleStyle;
    return LinearPercentIndicator(
      animation: true,
      animateFromLastPercent: true,
      backgroundColor: getStyle(context).backgroundColor ??
          resolvedStyle.backgroundModulePrimaryColor(context) ??
          Colors.white,
      progressColor: getStyle(context).color ??
          resolvedStyle.textModulePrimaryColor(context) ??
          Colors.black,
      barRadius: getStyle(context).borderRadius,
      percent: progress,
      padding: EdgeInsets.zero,
      lineHeight: Sizes.size08,
      center: center,
    );
  }
}
