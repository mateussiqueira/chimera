import 'package:design_system/design_system.dart';

import 'constructors/constructors.dart';
import 'destructive_button_style.dart';

class DestructiveButton extends ButtonStyleButton {
  DestructiveButton.standard({
    super.key,
    super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    String? text,
    this.semanticLabel,
    Widget? child,
  }) : super(
          child: Semantics(
            button: true,
            excludeSemantics: true,
            enabled: onPressed != null,
            label: semanticLabel ?? text,
            child: child ?? Text(text ?? ''),
          ),
        );

  factory DestructiveButton.sizeMd({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = DestructiveButtonMd;

  factory DestructiveButton.sizeXl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = DestructiveButtonXl;

  factory DestructiveButton.size2Xl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = DestructiveButton2Xl;

  factory DestructiveButton.iconMd({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = DestructiveButtonIconMd;

  factory DestructiveButton.iconXl({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = DestructiveButtonIconXl;

  factory DestructiveButton.icon2Xl({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = DestructiveButtonIcon2Xl;

  final String? semanticLabel;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return DestructiveButtonStyle.destructive(context);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
