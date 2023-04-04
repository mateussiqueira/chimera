import 'package:design_system/design_system.dart';

import '../button_size.dart';
import '../button_type.dart';
import '../button_with_icon_child.dart';

class SecondaryButtonWithIcon extends SecondaryButton {
  SecondaryButtonWithIcon({
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
    this.backgroundColor,
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
  final Color? backgroundColor;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return getButtonStyle(context).copyWith(
      backgroundColor: backgroundColor != null
          ? MaterialStatePropertyAll(backgroundColor)
          : null,
    );
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }

  ButtonStyle getButtonStyle(BuildContext context) {
    if (buttonType == ButtonType.iconOnly) {
      switch (buttonSize) {
        case ButtonSize.sizeMd:
          return SecondaryButtonStyle.iconOnlyMd(context);
        case ButtonSize.sizeXl:
          return SecondaryButtonStyle.iconOnlyXl(context);
        case ButtonSize.size2Xl:
          return SecondaryButtonStyle.iconOnly2Xl(context);
        default:
          return SecondaryButtonStyle.icon(context);
      }
    } else {
      switch (buttonSize) {
        case ButtonSize.sizeMd:
          return SecondaryButtonStyle.secondaryMd(context);
        case ButtonSize.sizeXl:
          return SecondaryButtonStyle.secondaryXl(context);
        case ButtonSize.size2Xl:
          return SecondaryButtonStyle.secondary2Xl(context);
        default:
          return SecondaryButtonStyle.secondary(context);
      }
    }
  }
}
