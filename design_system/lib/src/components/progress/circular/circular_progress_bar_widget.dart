import 'package:design_system/design_system.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgressBarWidget extends StatelessWidget {
  const CircularProgressBarWidget({
    Key? key,
    required this.progress,
    this.height,
    this.lineWidth,
    this.center,
    this.style,
  }) : super(key: key);

  final double progress;
  final double? height;
  final double? lineWidth;
  final Widget? center;
  final CircularProgressBarStyle? style;

  CircularProgressBarStyle getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<CircularProgressBarStyle>();
    return style ?? resolvedStyle ?? CircularProgressBarStyle.light;
  }

  @override
  Widget build(BuildContext context) {
    TertiaryModuleStyle? resolvedStyle = tertiaryModuleStyle;
    return CircularPercentIndicator(
      animation: true,
      animateFromLastPercent: true,
      backgroundColor: getStyle(context).backgroundColor ??
          resolvedStyle.backgroundModulePrimaryColor(context) ??
          Colors.white,
      progressColor: getStyle(context).color ??
          resolvedStyle.textModulePrimaryColor(context) ??
          Colors.black,
      percent: progress,
      radius: height ?? getStyle(context).height,
      circularStrokeCap: CircularStrokeCap.round,
      lineWidth: lineWidth ?? getStyle(context).lineWidth,
      center: center,
    );
  }
}
