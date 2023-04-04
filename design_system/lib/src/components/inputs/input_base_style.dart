import '../../../design_system.dart';

class InputBaseStyle extends ThemeExtension<InputBaseStyle> {
  const InputBaseStyle({
    this.backgroundColorDefault,
    this.backgroundColorDisabled,
    this.borderColorDefault,
    this.borderColorError,
    this.borderColorFocused,
    this.borderColorDisabled,
    this.borderRadius,
    this.borderWidth,
    this.helperTextDefaultColor,
    this.helperTextErrorColor,
    this.placeholderColor,
    this.textColor,
    this.titleTextColor,
  });

  final Color? backgroundColorDefault;
  final Color? backgroundColorDisabled;
  final Color? borderColorDefault;
  final Color? borderColorError;
  final Color? borderColorFocused;
  final Color? borderColorDisabled;
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final Color? helperTextDefaultColor;
  final Color? helperTextErrorColor;
  final Color? placeholderColor;
  final Color? textColor;
  final Color? titleTextColor;

  static final InputBaseStyle light = InputBaseStyle(
    borderRadius: defaultBorderRadius,
    borderWidth: defaultBorderWidth,
  );

  static final BorderRadius defaultBorderRadius = BorderRadius.circular(80);
  static const double defaultBorderWidth = 1;

  @override
  ThemeExtension<InputBaseStyle> copyWith({
    Color? backgroundColorDefault,
    Color? backgroundColorDisabled,
    Color? borderColorDefault,
    Color? borderColorError,
    Color? borderColorFocused,
    Color? borderColorDisabled,
    BorderRadius? borderRadius,
    double? borderWidth,
    Color? helperTextDefaultColor,
    Color? helperTextErrorColor,
    Color? placeholderColor,
    Color? textColor,
    Color? titleTextColor,
  }) =>
      InputBaseStyle(
        backgroundColorDefault:
            backgroundColorDefault ?? this.backgroundColorDefault,
        backgroundColorDisabled:
            backgroundColorDisabled ?? this.backgroundColorDisabled,
        borderColorDefault: borderColorDefault ?? this.borderColorDefault,
        borderColorError: borderColorError ?? this.borderColorError,
        borderColorFocused: borderColorFocused ?? this.borderColorFocused,
        borderColorDisabled: borderColorDisabled ?? this.borderColorDisabled,
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        helperTextDefaultColor:
            helperTextDefaultColor ?? this.helperTextDefaultColor,
        helperTextErrorColor: helperTextErrorColor ?? this.helperTextErrorColor,
        placeholderColor: placeholderColor ?? this.placeholderColor,
        textColor: textColor ?? this.textColor,
        titleTextColor: titleTextColor ?? this.titleTextColor,
      );

  @override
  ThemeExtension<InputBaseStyle> lerp(
          ThemeExtension<InputBaseStyle>? other, double t) =>
      this;
}
