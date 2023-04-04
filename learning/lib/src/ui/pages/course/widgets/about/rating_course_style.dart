import 'package:design_system/design_system.dart';

class RatingCourseStyle extends ThemeExtension<RatingCourseStyle> {
  const RatingCourseStyle({
    this.completedCourseBackgroundColor,
    this.completedCourseTextColor,
    this.backgroundColor,
    this.textColor,
  });

  final Color? completedCourseBackgroundColor;
  final Color? completedCourseTextColor;

  final Color? backgroundColor;
  final Color? textColor;

  @override
  RatingCourseStyle copyWith({
    Color? completedCourseBackgroundColor,
    Color? completedCourseTextColor,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return RatingCourseStyle(
      completedCourseTextColor:
          completedCourseTextColor ?? this.completedCourseTextColor,
      completedCourseBackgroundColor:
          completedCourseBackgroundColor ?? this.completedCourseBackgroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<RatingCourseStyle> lerp(
    ThemeExtension<RatingCourseStyle>? other,
    double t,
  ) =>
      this;
}
