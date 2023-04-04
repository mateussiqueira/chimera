import 'package:design_system/design_system.dart';

class CourseProgressStyle extends ThemeExtension<CourseProgressStyle> {
  const CourseProgressStyle({
    this.completedCourseBackgroundColor,
    this.completedCourseIconColor,
    this.completedCourseTextColor,
    this.completedCourseTextProgressColor,
    this.completedCourseTitleColor,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.textProgressColor,
    this.titleColor,
  });

  final Color? completedCourseBackgroundColor;
  final Color? completedCourseIconColor;
  final Color? completedCourseTextColor;
  final Color? completedCourseTextProgressColor;
  final Color? completedCourseTitleColor;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? textProgressColor;
  final Color? titleColor;

  @override
  CourseProgressStyle copyWith({
    Color? completedCourseBackgroundColor,
    Color? completedCourseIconColor,
    Color? completedCourseTextColor,
    Color? completedCourseTextProgressColor,
    Color? completedCourseTitleColor,
    Color? backgroundColor,
    Color? iconColor,
    Color? textColor,
    Color? textProgressColor,
    Color? titleColor,
  }) {
    return CourseProgressStyle(
      completedCourseBackgroundColor:
          completedCourseBackgroundColor ?? this.completedCourseBackgroundColor,
      completedCourseIconColor:
          completedCourseIconColor ?? this.completedCourseIconColor,
      completedCourseTextColor:
          completedCourseTextColor ?? this.completedCourseTextColor,
      completedCourseTextProgressColor: completedCourseTextProgressColor ??
          this.completedCourseTextProgressColor,
      completedCourseTitleColor:
          completedCourseTitleColor ?? this.completedCourseTitleColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
      textProgressColor: textProgressColor ?? this.textProgressColor,
      titleColor: titleColor ?? this.titleColor,
    );
  }

  @override
  ThemeExtension<CourseProgressStyle> lerp(
    ThemeExtension<CourseProgressStyle>? other,
    double t,
  ) =>
      this;
}
