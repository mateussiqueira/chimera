import 'package:design_system/design_system.dart';

class RowIconTextStyle extends ThemeExtension<RowIconTextStyle> {
  const RowIconTextStyle({
    this.iconColor,
    this.textColor,
  });

  final Color? iconColor;
  final Color? textColor;

  @override
  RowIconTextStyle copyWith({
    Color? iconColor,
    Color? textColor,
  }) {
    return RowIconTextStyle(
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<RowIconTextStyle> lerp(
    ThemeExtension<RowIconTextStyle>? other,
    double t,
  ) =>
      this;
}
