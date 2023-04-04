import 'package:design_system/design_system.dart';

import '../button_size.dart';
import '../button_type.dart';
import '../button_with_icon_child.dart';
import 'link_button_style.dart';

class LinkButtonWithIcon extends LinkButton {
  LinkButtonWithIcon({
    super.key,
    super.onPressed,
    ButtonStyle? style,
    FocusNode? focusNode,
    String? semanticLabel,
    this.text,
    this.leadingIcon,
    this.trailingIcon,
    required bool autofocus,
    required Clip clipBehavior,
    required this.buttonSize,
    required this.buttonType,
    this.foregroundColor,
    this.foregroundDisabledColor,
    this.foregroundPressedColor,
  }) : super.standard(
          child: ButtonWithIconChild(
            text: text,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            buttonSize: buttonSize,
            buttonType: buttonType,
          ),
          semanticLabel: semanticLabel ?? text,
        );

  final ButtonSize buttonSize;
  final ButtonType buttonType;
  final Icons? leadingIcon;
  final Icons? trailingIcon;
  final String? text;
  final Color? foregroundColor;
  final Color? foregroundDisabledColor;
  final Color? foregroundPressedColor;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    switch (buttonSize) {
      case ButtonSize.sizeMd:
        return LinkButtonStyle.linkMd(
          foregroundColor: foregroundColor,
          foregroundDisabledColor: foregroundDisabledColor,
          foregroundPressedColor: foregroundPressedColor,
          context: context,
        );
      case ButtonSize.sizeXl:
        return LinkButtonStyle.linkXl(
          foregroundColor: foregroundColor,
          foregroundDisabledColor: foregroundDisabledColor,
          foregroundPressedColor: foregroundPressedColor,
          context: context,
        );
      case ButtonSize.size2Xl:
        return LinkButtonStyle.link2Xl(
          foregroundColor: foregroundColor,
          foregroundDisabledColor: foregroundDisabledColor,
          foregroundPressedColor: foregroundPressedColor,
          context: context,
        );
      default:
        return LinkButtonStyle.link(context);
    }
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
