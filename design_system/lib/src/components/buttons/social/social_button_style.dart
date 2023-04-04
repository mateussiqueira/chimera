import 'package:design_system/design_system.dart';

import '../buttons_style.dart';

class SocialButtonStyle {
  static ButtonStyle social(BuildContext context) =>
      ButtonsStyle.standardButtonStyle.copyWith(
        textStyle: MaterialStatePropertyAll(TypographyTextMd.medium(context)),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        shape: MaterialStatePropertyAll(
          ButtonsStyle.standardRectangularShape(
            color: Colors.transparent,
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size16,
          ),
        ),
      );

  static ButtonStyle facebook(BuildContext context) => social(context).copyWith(
        backgroundColor: facebookBackgroundColor,
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size237, Sizes.size44),
        ),
      );

  static ButtonStyle apple(BuildContext context) => social(context).copyWith(
        backgroundColor: const MaterialStatePropertyAll(Colors.black),
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size206, Sizes.size44),
        ),
      );

  static ButtonStyle google(BuildContext context) => social(context).copyWith(
        foregroundColor: const MaterialStatePropertyAll(Colors.neutral700),
        backgroundColor: googleBackgroundColor,
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size216, Sizes.size44),
        ),
        shape: MaterialStatePropertyAll(
          ButtonsStyle.standardRectangularShape(
            color: Colors.neutral100,
          ),
        ),
      );

  static ButtonStyle icon(BuildContext context) => social(context).copyWith(
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size44, Sizes.size44),
        ),
        shape: MaterialStatePropertyAll(
          ButtonsStyle.standardCircularShape(
            color: Colors.transparent,
          ),
        ),
      );

  static ButtonStyle facebookIcon(BuildContext context) {
    return icon(context).copyWith(
      backgroundColor: facebookBackgroundColor,
      padding: const MaterialStatePropertyAll(
        EdgeInsets.all(Sizes.size10),
      ),
    );
  }

  static ButtonStyle googleIcon(BuildContext context) {
    return icon(context).copyWith(
      backgroundColor: googleBackgroundColor,
      padding: const MaterialStatePropertyAll(
        EdgeInsets.all(Sizes.size10),
      ),
    );
  }

  static ButtonStyle appleIcon(BuildContext context) {
    return icon(context).copyWith(
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.all(Sizes.size10),
      ),
    );
  }

  static MaterialStateProperty<Color?> get facebookBackgroundColor =>
      MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.facebookPressed;
          }
          return Colors.facebook;
        },
      );

  static MaterialStateProperty<Color?> get googleBackgroundColor =>
      MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.neutral050;
          }
          return Colors.white;
        },
      );
}
