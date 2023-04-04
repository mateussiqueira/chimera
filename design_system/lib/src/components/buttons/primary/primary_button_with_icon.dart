import 'package:design_system/design_system.dart';

import '../button_size.dart';
import '../button_type.dart';
import '../button_with_icon_child.dart';

class PrimaryButtonWithIcon extends PrimaryButton {
  PrimaryButtonWithIcon({
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
          return PrimaryButtonStyle.iconOnlyMd(context);
        case ButtonSize.sizeXl:
          return PrimaryButtonStyle.iconOnlyXl(context);
        case ButtonSize.size2Xl:
          return PrimaryButtonStyle.iconOnly2Xl(context);
        default:
          return PrimaryButtonStyle.icon(context);
      }
    } else {
      switch (buttonSize) {
        case ButtonSize.sizeMd:
          return PrimaryButtonStyle.primaryMd(context);
        case ButtonSize.sizeXl:
          return PrimaryButtonStyle.primaryXl(context);
        case ButtonSize.size2Xl:
          return PrimaryButtonStyle.primary2Xl(context);
        default:
          return PrimaryButtonStyle.primary(context);
      }
    }
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
