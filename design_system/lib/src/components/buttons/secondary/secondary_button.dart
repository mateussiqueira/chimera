import 'package:design_system/design_system.dart';

import 'constructors/constructors.dart';

class SecondaryButton extends ButtonStyleButton {
  SecondaryButton.standard({
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
    Color? backgroundColor,
  }) : super(
          child: child ??
              Semantics(
                button: true,
                excludeSemantics: true,
                enabled: onPressed != null,
                label: semanticLabel ?? text,
                child: Text(text ?? ''),
              ),
        );

  factory SecondaryButton.sizeMd({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
    Color? backgroundColor,
  }) = SecondaryButtonMd;

  factory SecondaryButton.sizeXl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
    Color? backgroundColor,
  }) = SecondaryButtonXl;

  factory SecondaryButton.size2Xl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
    Color? backgroundColor,
  }) = SecondaryButton2Xl;

  factory SecondaryButton.iconMd({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
    Color? backgroundColor,
  }) = SecondaryButtonIconMd;

  factory SecondaryButton.iconXl({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
    Color? backgroundColor,
  }) = SecondaryButtonIconXl;

  factory SecondaryButton.icon2Xl({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
    Color? backgroundColor,
  }) = SecondaryButtonIcon2Xl;

  final String? semanticLabel;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return SecondaryButtonStyle.secondary(context);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
