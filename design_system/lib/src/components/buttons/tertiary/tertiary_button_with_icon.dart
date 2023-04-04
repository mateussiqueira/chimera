import 'package:design_system/design_system.dart';

import '../button_size.dart';
import '../button_type.dart';
import '../button_with_icon_child.dart';

class TertiaryButtonWithIcon extends TertiaryButton {
  TertiaryButtonWithIcon({
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
            fullWidth: true,
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
          return TertiaryButtonStyle.iconOnlyMd(context);
        case ButtonSize.sizeXl:
          return TertiaryButtonStyle.iconOnlyXl(context);
        case ButtonSize.size2Xl:
          return TertiaryButtonStyle.iconOnly2Xl(context);
        default:
          return TertiaryButtonStyle.icon(context);
      }
    } else {
      switch (buttonSize) {
        case ButtonSize.sizeMd:
          return TertiaryButtonStyle.tertiaryMd(context);
        case ButtonSize.sizeXl:
          return TertiaryButtonStyle.tertiaryXl(context);
        case ButtonSize.size2Xl:
          return TertiaryButtonStyle.tertiary2Xl(context);
        default:
          return TertiaryButtonStyle.tertiary(context);
      }
    }
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
