import '../../../../design_system.dart';

class CheckboxBaseStyle extends ThemeExtension<CheckboxBaseStyle> {
  static const double sizeSm = 16;
  static const double sizeMd = 20;
  static const double radiusCheckboxSm = 4;
  static const double radiusCheckboxMd = 6;
  static double get radiusCircleSm => sizeSm / 2;
  static double get radiusCircleMd => sizeMd / 2;
  static const double radioButtonIconSizeSm = 6;
  static const double radioButtonIconSizeMd = 8;

  static Widget radioIconCircle(
          {required CheckboxSize size, required Color color}) =>
      SizedBox(
        width: size == CheckboxSize.sizeSm
            ? radioButtonIconSizeSm
            : radioButtonIconSizeMd,
        height: size == CheckboxSize.sizeSm
            ? radioButtonIconSizeSm
            : radioButtonIconSizeMd,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      );

  final Color? backgroundColorChecked;
  final Color? backgroundColorDefault;
  final Color? backgroundColorDisabled;
  final Color? borderColorDefault;
  final Color? iconColor;
  final Color? iconDisabledColor;

  const CheckboxBaseStyle({
    this.backgroundColorChecked,
    this.backgroundColorDefault,
    this.backgroundColorDisabled,
    this.borderColorDefault,
    this.iconColor,
    this.iconDisabledColor,
  });

  static const CheckboxBaseStyle light = CheckboxBaseStyle();

  @override
  CheckboxBaseStyle copyWith({
    Color? backgroundColorChecked,
    Color? backgroundColorDefault,
    Color? backgroundColorDisabled,
    Color? borderColorDefault,
    Color? iconColor,
    Color? iconDisabledColor,
  }) {
    return CheckboxBaseStyle(
      backgroundColorChecked:
          backgroundColorChecked ?? this.backgroundColorChecked,
      backgroundColorDefault:
          backgroundColorDefault ?? this.backgroundColorDefault,
      backgroundColorDisabled:
          backgroundColorDisabled ?? this.backgroundColorDisabled,
      borderColorDefault: borderColorDefault ?? this.borderColorDefault,
      iconColor: iconColor ?? this.iconColor,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
    );
  }

  @override
  ThemeExtension<CheckboxBaseStyle> lerp(
          ThemeExtension<CheckboxBaseStyle>? other, double t) =>
      this;
}
