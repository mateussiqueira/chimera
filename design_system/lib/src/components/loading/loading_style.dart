import 'package:design_system/design_system.dart';

class LoadingStyle extends ThemeExtension<LoadingStyle> {
  static const double boxSize = 84;
  static const double defaultContentRadius = 42;
  final List<BoxShadow> shadow = Shadows.shadowXs;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final double contentRadius;

  static LoadingStyle light = LoadingStyle(
    contentRadius: defaultContentRadius,
  );

  LoadingStyle({
    this.backgroundColor,
    this.indicatorColor,
    required this.contentRadius,
  });

  @override
  ThemeExtension<LoadingStyle> copyWith({
    Color? backgroundColor,
    Color? indicatorColor,
    double? contentRadius,
  }) =>
      LoadingStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        indicatorColor: indicatorColor ?? this.indicatorColor,
        contentRadius: contentRadius ?? this.contentRadius,
      );

  @override
  ThemeExtension<LoadingStyle> lerp(
          ThemeExtension<LoadingStyle>? other, double t) =>
      this;
}
