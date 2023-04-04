import 'package:design_system/design_system.dart';

class ButtonsStyle {
  static ButtonStyle get standardButtonStyle => ButtonStyle(
        minimumSize: ButtonStyleButton.allOrNull<Size>(
          const Size(Sizes.size40, Sizes.size40),
        ),
        maximumSize: ButtonStyleButton.allOrNull(Size.infinite),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        elevation: MaterialStateProperty.all(0),
        mouseCursor: MaterialStateProperty.all(SystemMouseCursors.click),
        visualDensity: VisualDensity.comfortable,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        animationDuration: kThemeChangeDuration,
        enableFeedback: true,
        alignment: Alignment.center,
        splashFactory: NoSplash.splashFactory,
      );

  static OutlinedBorder standardRectangularShape({
    required Color color,
  }) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        Sizes.size80,
      ),
      side: BorderSide(
        color: color,
        width: Sizes.size01,
      ),
    );
  }

  static OutlinedBorder standardCircularShape({
    required Color color,
  }) {
    return CircleBorder(
      side: BorderSide(
        color: color,
        width: Sizes.size01,
      ),
    );
  }
}
