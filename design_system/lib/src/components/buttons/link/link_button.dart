import 'package:design_system/design_system.dart';

import 'constructors/constructors.dart';
import 'link_button_style.dart';

class LinkButton extends ButtonStyleButton {
  LinkButton.standard({
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

  factory LinkButton.sizeMd({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
    Color? foregroundColor,
    Color? foregroundDisabledColor,
    Color? foregroundPressedColor,
  }) = LinkButtonMd;

  factory LinkButton.sizeXl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
    Color? foregroundColor,
    Color? foregroundDisabledColor,
    Color? foregroundPressedColor,
  }) = LinkButtonXl;

  factory LinkButton.size2Xl({
    Key key,
    VoidCallback? onPressed,
    FocusNode? focusNode,
    String? text,
    String? semanticLabel,
    Icons? leadingIcon,
    Icons? trailingIcon,
    bool autofocus,
    Clip clipBehavior,
    Color? foregroundColor,
    Color? foregroundDisabledColor,
    Color? foregroundPressedColor,
  }) = LinkButton2Xl;

  final String? semanticLabel;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return LinkButtonStyle.link(context);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return defaultStyleOf(context);
  }
}
