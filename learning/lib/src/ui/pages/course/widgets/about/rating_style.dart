import 'package:design_system/design_system.dart';

class RatingStyle extends ThemeExtension<RatingStyle> {
  const RatingStyle({
    this.completedCourseColor,
    this.defaultColor,
  });

  final Color? completedCourseColor;
  final Color? defaultColor;

  @override
  RatingStyle copyWith({
    Color? completedCourseColor,
    Color? defaultColor,
  }) {
    return RatingStyle(
      completedCourseColor: completedCourseColor ?? this.completedCourseColor,
      defaultColor: defaultColor ?? this.defaultColor,
    );
  }

  @override
  ThemeExtension<RatingStyle> lerp(
    ThemeExtension<RatingStyle>? other,
    double t,
  ) =>
      this;
}
