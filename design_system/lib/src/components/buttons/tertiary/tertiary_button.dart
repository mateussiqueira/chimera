import 'package:design_system/design_system.dart';

import 'constructors/constructors.dart';

class TertiaryButton extends ButtonStyleButton {
  TertiaryButton.standard({
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
          child: child ??
              Semantics(
                button: true,
                excludeSemantics: true,
                enabled: onPressed != null,
                label: semanticLabel ?? text,
                child: Text(text ?? ''),
              ),
        );

  factory TertiaryButton.sizeMd({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = TertiaryButtonMd;

  factory TertiaryButton.sizeXl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = TertiaryButtonXl;

  factory TertiaryButton.size2Xl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
  }) = TertiaryButton2Xl;

  factory TertiaryButton.iconMd({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = TertiaryButtonIconMd;

  factory TertiaryButton.iconXl({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = TertiaryButtonIconXl;

  factory TertiaryButton.icon2Xl({
    Key key,
    VoidCallback? onPressed,
    String? semanticLabel,
    required Icons icon,
    bool autofocus,
    Clip clipBehavior,
  }) = TertiaryButtonIcon2Xl;

  final String? semanticLabel;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return TertiaryButtonStyle.tertiary(context);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
