import 'package:design_system/design_system.dart';

import '../buttons_style.dart';

class SecondaryButtonStyle extends ButtonBaseColorStyle<SecondaryButtonStyle> {
  const SecondaryButtonStyle({
    super.backgroundDefaultColor,
    super.backgroundDisabledColor,
    super.backgroundPressedColor,
    super.foregroundDefaultColor,
    super.foregroundDisabledColor,
    super.foregroundPressedColor,
  });

  static ButtonStyle secondary(BuildContext context) =>
      ButtonsStyle.standardButtonStyle.copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextSm.medium(context)),
        foregroundColor: foregroundMaterialColor(context),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return themeExtension(context)?.backgroundPressedColor ??
                  tertiaryModuleStyle.backgroundModuleSecondaryColor(context);
            } else if (states.contains(MaterialState.disabled)) {
              return themeExtension(context)?.backgroundDisabledColor ??
                  tertiaryModuleStyle.backgroundModulePrimaryColor(context);
            }
            return themeExtension(context)?.backgroundDefaultColor ??
                tertiaryModuleStyle.backgroundModulePrimaryColor(context);
          },
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ButtonsStyle.standardRectangularShape(
                color: themeExtension(context)?.backgroundDisabledColor ??
                    tertiaryModuleStyle.backgroundModulePrimaryColor(context) ??
                    Colors.transparent,
              );
            }
            return ButtonsStyle.standardRectangularShape(
              color: themeExtension(context)?.backgroundDefaultColor ??
                  tertiaryModuleStyle.backgroundModulePrimaryColor(context) ??
                  Colors.transparent,
            );
          },
        ),
      );

  static ButtonStyle secondaryMd(BuildContext context) =>
      secondary(context).copyWith(
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

  static ButtonStyle secondaryXl(BuildContext context) =>
      secondary(context).copyWith(
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

  static ButtonStyle secondary2Xl(BuildContext context) =>
      secondary(context).copyWith(
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

  static ButtonStyle icon(BuildContext context) => secondary(context).copyWith(
        shape: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return ButtonsStyle.standardCircularShape(
                color: themeExtension(context)?.backgroundDisabledColor ??
                    primaryModuleStyle.backgroundModuleTertiaryColor(context) ??
                    Colors.transparent,
              );
            }
            return ButtonsStyle.standardCircularShape(
              color: themeExtension(context)?.backgroundDefaultColor ??
                  primaryModuleStyle.backgroundModulePrimaryColor(context) ??
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

  static MaterialStateProperty<Color> foregroundMaterialColor(
      BuildContext context) {
    return MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.pressed)) {
          return themeExtension(context)?.foregroundPressedColor ??
              tertiaryModuleStyle.textModuleSecondaryColor(context) ??
              Colors.black;
        } else if (states.contains(MaterialState.disabled)) {
          return themeExtension(context)?.foregroundDisabledColor ??
              primaryModuleStyle.textModuleTertiaryColor(context) ??
              Colors.black;
        }
        return themeExtension(context)?.foregroundDefaultColor ??
            tertiaryModuleStyle.textModulePrimaryColor(context) ??
            Colors.black;
      },
    );
  }

  @override
  ThemeExtension<SecondaryButtonStyle> lerp(
    ThemeExtension<SecondaryButtonStyle>? other,
    double t,
  ) =>
      this;

  @override
  SecondaryButtonStyle copyWith({
    Color? backgroundDefaultColor,
    Color? backgroundDisabledColor,
    Color? backgroundPressedColor,
    Color? foregroundDefaultColor,
    Color? foregroundDisabledColor,
    Color? foregroundPressedColor,
  }) {
    return SecondaryButtonStyle(
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

  static SecondaryButtonStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<SecondaryButtonStyle>();
}
