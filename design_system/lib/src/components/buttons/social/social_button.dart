import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/buttons/button_type.dart';
import 'package:design_system/src/components/buttons/social/social_button_style.dart';

class SocialButton extends ButtonStyleButton {
  SocialButton({
    super.key,
    required String text,
    required Icons icon,
    required super.style,
    required ButtonType type,
    super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
  }) : super(
          child: SocialButtonWithIconChild(
            text: text,
            icon: icon,
            type: type,
          ),
        );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return SocialButtonStyle.social(context);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}

class SocialButtonWithIconChild extends StatelessWidget {
  const SocialButtonWithIconChild({
    Key? key,
    required this.text,
    required this.icon,
    required this.type,
  }) : super(key: key);

  final String text;
  final Icons icon;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.iconOnly) {
      return iconGenerator;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        iconGenerator,
        const SpacingHorizontal.spacing12(),
        Text(text),
      ],
    );
  }

  Widget get iconGenerator => icon.iconCopyWith(size: Sizes.size24);
}
