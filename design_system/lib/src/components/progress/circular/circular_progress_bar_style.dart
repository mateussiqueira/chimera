import '../../../../design_system.dart';

class CircularProgressBarStyle
    extends ThemeExtension<CircularProgressBarStyle> {
  const CircularProgressBarStyle({
    this.color,
    this.backgroundColor,
    required this.height,
    required this.lineWidth,
  });

  final Color? color;
  final Color? backgroundColor;
  final double height;
  final double lineWidth;

  static const CircularProgressBarStyle light = CircularProgressBarStyle(
    height: Sizes.size44,
    lineWidth: Sizes.size08,
  );

  @override
  CircularProgressBarStyle copyWith({
    Color? color,
    Color? backgroundColor,
    double? height,
    double? lineWidth,
  }) {
    return CircularProgressBarStyle(
        color: color ?? this.color,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        height: height ?? this.height,
        lineWidth: lineWidth ?? this.lineWidth);
  }

  @override
  ThemeExtension<CircularProgressBarStyle> lerp(
    ThemeExtension<CircularProgressBarStyle>? other,
    double t,
  ) {
    return this;
  }
}
