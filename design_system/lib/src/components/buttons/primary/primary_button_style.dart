import 'package:design_system/design_system.dart';

import '../buttons_style.dart';

class PrimaryButtonStyle extends ButtonBaseColorStyle<PrimaryButtonStyle> {
  const PrimaryButtonStyle({
    super.backgroundDefaultColor,
    super.backgroundDisabledColor,
    super.backgroundPressedColor,
    super.foregroundDefaultColor,
    super.foregroundDisabledColor,
    super.foregroundPressedColor,
  });

  static ButtonStyle primary(BuildContext context) =>
      ButtonsStyle.standardButtonStyle.copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextSm.medium(context)),
        foregroundColor: MaterialStatePropertyAll(
          themeExtension(context)?.foregroundDefaultColor ??
              secondaryModuleStyle.textModulePrimaryColor(context),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return themeExtension(context)?.backgroundPressedColor ??
                  secondaryModuleStyle.backgroundModuleSecondaryColor(context);
            } else if (states.contains(MaterialState.disabled)) {
              return themeExtension(context)?.backgroundDisabledColor ??
                  secondaryModuleStyle.backgroundModuleTertiaryColor(context);
            }
            return themeExtension(context)?.backgroundDefaultColor ??
                secondaryModuleStyle.backgroundModulePrimaryColor(context);
          },
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ButtonsStyle.standardRectangularShape(
                  color: themeExtension(context)?.backgroundDisabledColor ??
                      secondaryModuleStyle
                          .backgroundModuleTertiaryColor(context) ??
                      Colors.transparent);
            }
            return ButtonsStyle.standardRectangularShape(
              color: themeExtension(context)?.backgroundDefaultColor ??
                  secondaryModuleStyle
                      .backgroundModuleSecondaryColor(context) ??
                  Colors.transparent,
            );
          },
        ),
      );

  static ButtonStyle primaryMd(BuildContext context) =>
      primary(context).copyWith(
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

  static ButtonStyle primaryXl(BuildContext context) =>
      primary(context).copyWith(
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

  static ButtonStyle primary2Xl(BuildContext context) =>
      primary(context).copyWith(
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

  static ButtonStyle icon(BuildContext context) => primary(context).copyWith(
        shape: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ButtonsStyle.standardCircularShape(
                color: themeExtension(context)?.backgroundDisabledColor ??
                    secondaryModuleStyle
                        .backgroundModuleTertiaryColor(context) ??
                    Colors.transparent,
              );
            }
            return ButtonsStyle.standardCircularShape(
              color: themeExtension(context)?.backgroundDefaultColor ??
                  secondaryModuleStyle
                      .backgroundModuleSecondaryColor(context) ??
                  Colors.transparent,
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
  ThemeExtension<PrimaryButtonStyle> lerp(
    ThemeExtension<PrimaryButtonStyle>? other,
    double t,
  ) =>
      this;

  @override
  PrimaryButtonStyle copyWith({
    Color? backgroundDefaultColor,
    Color? backgroundDisabledColor,
    Color? backgroundPressedColor,
    Color? foregroundDefaultColor,
    Color? foregroundDisabledColor,
    Color? foregroundPressedColor,
  }) {
    return PrimaryButtonStyle(
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

  static PrimaryButtonStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<PrimaryButtonStyle>();
}
