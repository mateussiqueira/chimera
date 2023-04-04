import 'package:design_system/design_system.dart';

import '../buttons_style.dart';

class DestructiveButtonStyle {
  static ButtonStyle destructive(BuildContext context) {
    return ButtonsStyle.standardButtonStyle.copyWith(
      textStyle: MaterialStatePropertyAll(TypographyTextSm.medium(context)),
      foregroundColor: MaterialStatePropertyAll(
        primaryModuleStyle.backgroundModuleSecondaryColor(context),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return dangerModuleStyle.textModuleSecondaryColor(context);
          } else if (states.contains(MaterialState.disabled)) {
            return dangerModuleStyle.backgroundModuleTertiaryColor(context);
          }
          return dangerModuleStyle.textModulePrimaryColor(context);
        },
      ),
      shape: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ButtonsStyle.standardRectangularShape(
              color: dangerModuleStyle.backgroundModuleTertiaryColor(context) ??
                  Colors.transparent,
            );
          }
          return ButtonsStyle.standardRectangularShape(
            color: dangerModuleStyle.textModulePrimaryColor(context) ??
                Colors.transparent,
          );
        },
      ),
    );
  }

  static ButtonStyle destructiveMd(BuildContext context) {
    return destructive(context).copyWith(
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
  }

  static ButtonStyle destructiveXl(BuildContext context) {
    return destructive(context).copyWith(
      textStyle: MaterialStatePropertyAll(TypographyTextMd.medium(context)),
      foregroundColor: MaterialStatePropertyAll(
        primaryModuleStyle.backgroundModuleSecondaryColor(context),
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
  }

  static ButtonStyle destructive2Xl(BuildContext context) {
    return destructive(context).copyWith(
      textStyle: MaterialStatePropertyAll(TypographyTextLg.medium(context)),
      foregroundColor: MaterialStatePropertyAll(
        primaryModuleStyle.backgroundModuleSecondaryColor(context),
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
  }

  static ButtonStyle icon(BuildContext context) {
    return destructive(context).copyWith(
      shape: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ButtonsStyle.standardCircularShape(
              color: dangerModuleStyle.backgroundModuleTertiaryColor(context) ??
                  Colors.transparent,
            );
          }
          return ButtonsStyle.standardCircularShape(
            color: dangerModuleStyle.textModulePrimaryColor(context) ??
                Colors.transparent,
          );
        },
      ),
    );
  }

  static ButtonStyle iconOnlyMd(BuildContext context) {
    return icon(context).copyWith(
      minimumSize: ButtonStyleButton.allOrNull<Size>(
        const Size(Sizes.size40, Sizes.size40),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.all(Sizes.size10),
      ),
    );
  }

  static ButtonStyle iconOnlyXl(BuildContext context) {
    return icon(context).copyWith(
      minimumSize: ButtonStyleButton.allOrNull<Size>(
        const Size(Sizes.size48, Sizes.size48),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.all(Sizes.size16),
      ),
    );
  }

  static ButtonStyle iconOnly2Xl(BuildContext context) {
    return icon(context).copyWith(
      minimumSize: ButtonStyleButton.allOrNull<Size>(
        const Size(Sizes.size56, Sizes.size56),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.all(Sizes.size18),
      ),
    );
  }
}
