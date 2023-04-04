import 'package:design_system/design_system.dart';

class ListDotStyle extends ThemeExtension<ListDotStyle> {
  const ListDotStyle({
    this.dotColor,
    this.textColor,
  });

  final Color? dotColor;
  final Color? textColor;

  @override
  ListDotStyle copyWith({
    Color? dotColor,
    Color? textColor,
  }) {
    return ListDotStyle(
      dotColor: dotColor ?? this.dotColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<ListDotStyle> lerp(
    ThemeExtension<ListDotStyle>? other,
    double t,
  ) =>
      this;
}
