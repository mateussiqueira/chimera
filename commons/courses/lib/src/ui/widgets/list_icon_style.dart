import 'package:design_system/design_system.dart';

class ListIconStyle extends ThemeExtension<ListIconStyle> {
  const ListIconStyle({
    this.iconBackgroundColor,
    this.iconColor,
    this.textColor,
  });

  final Color? iconBackgroundColor;
  final Color? iconColor;
  final Color? textColor;

  @override
  ListIconStyle copyWith({
    Color? iconBackgroundColor,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListIconStyle(
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<ListIconStyle> lerp(
    ThemeExtension<ListIconStyle>? other,
    double t,
  ) =>
      this;
}
