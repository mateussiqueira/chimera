import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/buttons/buttons_style.dart';

class TertiaryButtonStyle extends ButtonBaseColorStyle<TertiaryButtonStyle> {
  const TertiaryButtonStyle({
    super.backgroundDefaultColor,
    super.backgroundDisabledColor,
    super.backgroundPressedColor,
    super.foregroundDefaultColor,
    super.foregroundDisabledColor,
    super.foregroundPressedColor,
  });
  static ButtonStyle tertiary(BuildContext context) =>
      ButtonsStyle.standardButtonStyle.copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextSm.medium(context)),
        foregroundColor: MaterialStatePropertyAll(
          themeExtension(context)?.foregroundDefaultColor ??
              tertiaryModuleStyle.textModulePrimaryColor(context),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return themeExtension(context)?.backgroundPressedColor ??
                  quaternaryModuleStyle.textModulePrimaryColor(context);
            } else if (states.contains(MaterialState.disabled)) {
              return themeExtension(context)?.backgroundDisabledColor ??
                  quaternaryModuleStyle
                      .textModulePrimaryColor(context)
                      ?.withOpacity(0.6);
            }
            return themeExtension(context)?.backgroundDefaultColor ??
                quaternaryModuleStyle.textModulePrimaryColor(context);
          },
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ButtonsStyle.standardRectangularShape(
                color: Colors.transparent,
              );
            }
            return ButtonsStyle.standardRectangularShape(
              color: Colors.transparent,
            );
          },
        ),
      );

  static ButtonStyle tertiaryMd(BuildContext context) =>
      tertiary(context).copyWith(
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size165, Sizes.size40),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size16,
          ),
        ),
      );

  static ButtonStyle tertiaryXl(BuildContext context) =>
      tertiary(context).copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextMd.medium(context)),
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size184, Sizes.size48),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: Sizes.size12,
            horizontal: Sizes.size20,
          ),
        ),
      );

  static ButtonStyle tertiary2Xl(BuildContext context) =>
      tertiary(context).copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextLg.medium(context)),
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size227, Sizes.size60),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: Sizes.size16,
            horizontal: Sizes.size28,
          ),
        ),
      );

  static ButtonStyle icon(BuildContext context) => tertiary(context).copyWith(
        shape: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ButtonsStyle.standardCircularShape(
                color: Colors.transparent,
              );
            }
            return ButtonsStyle.standardCircularShape(
              color: Colors.transparent,
            );
          },
        ),
      );

  static ButtonStyle iconOnlyMd(BuildContext context) => icon(context).copyWith(
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size40, Sizes.size40),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(Sizes.size10),
        ),
      );

  static ButtonStyle iconOnlyXl(BuildContext context) => icon(context).copyWith(
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size48, Sizes.size48),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(Sizes.size16),
        ),
      );

  static ButtonStyle iconOnly2Xl(BuildContext context) =>
      icon(context).copyWith(
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size56, Sizes.size56),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(Sizes.size18),
        ),
      );

  @override
  ThemeExtension<TertiaryButtonStyle> lerp(
    ThemeExtension<TertiaryButtonStyle>? other,
    double t,
  ) =>
      this;

  @override
  TertiaryButtonStyle copyWith({
    Color? backgroundDefaultColor,
    Color? backgroundDisabledColor,
    Color? backgroundPressedColor,
    Color? foregroundDefaultColor,
    Color? foregroundDisabledColor,
    Color? foregroundPressedColor,
  }) {
    return TertiaryButtonStyle(
      backgroundDefaultColor:
          backgroundDefaultColor ?? this.backgroundDefaultColor,
      backgroundDisabledColor:
          backgroundDisabledColor ?? this.backgroundDisabledColor,
      backgroundPressedColor:
          backgroundPressedColor ?? this.backgroundPressedColor,
      foregroundDefaultColor:
          foregroundDefaultColor ?? this.foregroundDefaultColor,
      foregroundDisabledColor:
          foregroundDisabledColor ?? this.foregroundDisabledColor,
      foregroundPressedColor:
          foregroundPressedColor ?? this.foregroundPressedColor,
    );
  }

  static TertiaryButtonStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<TertiaryButtonStyle>();
}
