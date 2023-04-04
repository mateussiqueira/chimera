import 'package:design_system/design_system.dart';

class ContentAppBarStyle extends ThemeExtension<ContentAppBarStyle> {
  const ContentAppBarStyle({
    this.backgroundColor,
    this.textColor,
  });

  final Color? backgroundColor;
  final Color? textColor;

  @override
  ContentAppBarStyle copyWith({
    Color? backgroundColor,
    Color? textColor,
  }) {
    return ContentAppBarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<ContentAppBarStyle> lerp(
    ThemeExtension<ContentAppBarStyle>? other,
    double t,
  ) =>
      this;
}
