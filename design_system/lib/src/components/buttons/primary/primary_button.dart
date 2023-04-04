import 'package:design_system/design_system.dart';

import 'constructors/constructors.dart';

class PrimaryButton extends ButtonStyleButton {
  PrimaryButton.standard({
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

  factory PrimaryButton.sizeMd({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = PrimaryButtonMd;

  factory PrimaryButton.sizeXl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = PrimaryButtonXl;

  factory PrimaryButton.size2Xl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = PrimaryButton2Xl;

  factory PrimaryButton.iconMd({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = PrimaryButtonIconMd;

  factory PrimaryButton.iconXl({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = PrimaryButtonIconXl;

  factory PrimaryButton.icon2Xl({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = PrimaryButtonIcon2Xl;

  final String? semanticLabel;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return PrimaryButtonStyle.primary(context);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
