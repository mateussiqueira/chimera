import '../../../design_system.dart';

class ToastStyle extends ThemeExtension<ToastStyle> {
  const ToastStyle({
    this.backgroundErrorColor,
    this.backgroundInfoColor,
    this.backgroundSuccessColor,
    this.radius,
    this.textColor,
  });

  final Color? backgroundErrorColor;
  final Color? backgroundInfoColor;
  final Color? backgroundSuccessColor;
  final double? radius;
  final Color? textColor;

  static const ToastStyle light = ToastStyle(
    radius: Sizes.size08,
  );

  @override
  ThemeExtension<ToastStyle> copyWith({
    Color? backgroundErrorColor,
    Color? backgroundInfoColor,
    Color? backgroundSuccessColor,
    double? radius,
    Color? textColor,
  }) =>
      ToastStyle(
        backgroundErrorColor: backgroundErrorColor ?? this.backgroundErrorColor,
        backgroundInfoColor: backgroundInfoColor ?? this.backgroundInfoColor,
        backgroundSuccessColor:
            backgroundSuccessColor ?? this.backgroundSuccessColor,
        radius: radius ?? this.radius,
        textColor: textColor ?? this.textColor,
      );

  @override
  ThemeExtension<ToastStyle> lerp(
          ThemeExtension<ToastStyle>? other, double t) =>
      this;
}
