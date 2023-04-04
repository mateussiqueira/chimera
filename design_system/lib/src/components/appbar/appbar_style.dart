import 'package:design_system/design_system.dart';

class AppBarStyle extends ThemeExtension<AppBarStyle> {
  const AppBarStyle({
    this.primaryBackgroundColor,
    this.primaryTextColor,
    this.secondaryBackgroundColor,
    this.secondaryTextColor,
  });

  final Color? primaryBackgroundColor;
  final Color? primaryTextColor;
  final Color? secondaryBackgroundColor;
  final Color? secondaryTextColor;

  static AppBarStyle light = const AppBarStyle();

  @override
  AppBarStyle copyWith({
    Color? primaryBackgroundColor,
    Color? primaryTextColor,
    Color? secondaryBackgroundColor,
    Color? secondaryTextColor,
  }) {
    return AppBarStyle(
      primaryBackgroundColor:
          primaryBackgroundColor ?? this.primaryBackgroundColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryBackgroundColor:
          secondaryBackgroundColor ?? this.secondaryBackgroundColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
    );
  }

  @override
  ThemeExtension<AppBarStyle> lerp(
    ThemeExtension<AppBarStyle>? other,
    double t,
  ) {
    return this;
  }
}
