import 'package:design_system/design_system.dart';

class EnrollmentExpirationStyle
    extends ThemeExtension<EnrollmentExpirationStyle> {
  const EnrollmentExpirationStyle({
    this.expiringBackgroundColor,
    this.expiringTextColor,
    this.backgroundColor,
    this.textColor,
  });

  final Color? expiringBackgroundColor;
  final Color? expiringTextColor;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  EnrollmentExpirationStyle copyWith({
    Color? expiringBackgroundColor,
    Color? expiringTextColor,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return EnrollmentExpirationStyle(
      expiringBackgroundColor:
          expiringBackgroundColor ?? this.expiringBackgroundColor,
      expiringTextColor: expiringTextColor ?? this.expiringTextColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<EnrollmentExpirationStyle> lerp(
    ThemeExtension<EnrollmentExpirationStyle>? other,
    double t,
  ) =>
      this;
}
