import '../../../../design_system.dart';

class LinearProgressBarStyle extends ThemeExtension<LinearProgressBarStyle> {
  const LinearProgressBarStyle({
    this.color,
    this.backgroundColor,
    required this.borderRadius,
  });

  final Color? color;
  final Color? backgroundColor;
  final Radius borderRadius;

  static const LinearProgressBarStyle light = LinearProgressBarStyle(
    borderRadius: Radius.circular(
      Sizes.size16,
    ),
  );

  @override
  LinearProgressBarStyle copyWith({
    Color? color,
    Color? backgroundColor,
    Radius? borderRadius,
  }) {
    return LinearProgressBarStyle(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<LinearProgressBarStyle> lerp(
    ThemeExtension<LinearProgressBarStyle>? other,
    double t,
  ) {
    return this;
  }
}
