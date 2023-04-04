import 'package:design_system/design_system.dart';

import '../button_size.dart';
import '../button_type.dart';
import '../button_with_icon_child.dart';
import 'destructive_button_style.dart';

class DestructiveButtonWithIcon extends DestructiveButton {
  DestructiveButtonWithIcon({
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

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    if (buttonType == ButtonType.iconOnly) {
      switch (buttonSize) {
        case ButtonSize.sizeMd:
          return DestructiveButtonStyle.iconOnlyMd(context);
        case ButtonSize.sizeXl:
          return DestructiveButtonStyle.iconOnlyXl(context);
        case ButtonSize.size2Xl:
          return DestructiveButtonStyle.iconOnly2Xl(context);
        default:
          return DestructiveButtonStyle.icon(context);
      }
    } else {
      switch (buttonSize) {
        case ButtonSize.sizeMd:
          return DestructiveButtonStyle.destructiveMd(context);
        case ButtonSize.sizeXl:
          return DestructiveButtonStyle.destructiveXl(context);
        case ButtonSize.size2Xl:
          return DestructiveButtonStyle.destructive2Xl(context);
        default:
          return DestructiveButtonStyle.destructive(context);
      }
    }
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
