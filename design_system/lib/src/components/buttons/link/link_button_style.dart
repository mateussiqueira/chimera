import 'package:design_system/design_system.dart';

import '../buttons_style.dart';

class LinkButtonStyle extends ButtonBaseColorStyle<LinkButtonStyle> {
  const LinkButtonStyle({
    super.backgroundDefaultColor,
    super.backgroundDisabledColor,
    super.backgroundPressedColor,
    super.foregroundDefaultColor,
    super.foregroundDisabledColor,
    super.foregroundPressedColor,
  });

  static ButtonStyle link(BuildContext context) =>
      ButtonsStyle.standardButtonStyle.copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextSm.medium(context)),
        foregroundColor: _foregroundMaterialColor(context: context),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        shape: MaterialStatePropertyAll(
          ButtonsStyle.standardRectangularShape(color: Colors.transparent),
        ),
      );

  static ButtonStyle linkMd({
    Color? foregroundPressedColor,
    Color? foregroundDisabledColor,
    Color? foregroundColor,
    required BuildContext context,
  }) =>
      link(context).copyWith(
        foregroundColor: _foregroundMaterialColor(
          foregroundColor: foregroundColor,
          pressedColor: foregroundPressedColor,
          disabledColor: foregroundDisabledColor,
          context: context,
        ),
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

  static ButtonStyle linkXl({
    Color? foregroundPressedColor,
    Color? foregroundDisabledColor,
    Color? foregroundColor,
    required BuildContext context,
  }) =>
      link(context).copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextMd.medium(context)),
        foregroundColor: _foregroundMaterialColor(
          foregroundColor: foregroundColor,
          pressedColor: foregroundPressedColor,
          disabledColor: foregroundDisabledColor,
          context: context,
        ),
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

  static ButtonStyle link2Xl({
    Color? foregroundPressedColor,
    Color? foregroundDisabledColor,
    Color? foregroundColor,
    required BuildContext context,
  }) =>
      link(context).copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextLg.medium(context)),
        foregroundColor: _foregroundMaterialColor(
          foregroundColor: foregroundColor,
          pressedColor: foregroundPressedColor,
          disabledColor: foregroundDisabledColor,
          context: context,
        ),
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

  static MaterialStateProperty<Color?> _foregroundMaterialColor({
    Color? pressedColor,
    Color? disabledColor,
    Color? foregroundColor,
    required BuildContext context,
  }) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return pressedColor ??
            themeExtension(context)?.foregroundPressedColor ??
            primaryModuleStyle.textModulePrimaryColor(context);
      } else if (states.contains(MaterialState.disabled)) {
        return disabledColor ??
            themeExtension(context)?.foregroundDisabledColor ??
            primaryModuleStyle.textModuleTertiaryColor(context);
      }
      return foregroundColor ??
          themeExtension(context)?.foregroundDefaultColor ??
          primaryModuleStyle.textModuleSecondaryColor(context);
    });
  }

  @override
  ThemeExtension<LinkButtonStyle> lerp(
    ThemeExtension<LinkButtonStyle>? other,
    double t,
  ) =>
      this;

  @override
  LinkButtonStyle copyWith({
    Color? backgroundDefaultColor,
    Color? backgroundDisabledColor,
    Color? backgroundPressedColor,
    Color? foregroundDefaultColor,
    Color? foregroundDisabledColor,
    Color? foregroundPressedColor,
  }) {
    return LinkButtonStyle(
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

  static LinkButtonStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<LinkButtonStyle>();
}
