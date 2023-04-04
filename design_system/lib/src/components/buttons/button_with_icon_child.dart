import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/buttons/button_size.dart';
import 'package:design_system/src/components/buttons/button_type.dart';

class ButtonWithIconChild extends StatelessWidget {
  const ButtonWithIconChild({
    Key? key,
    this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.fullWidth = false,
    required this.buttonSize,
    required this.buttonType,
  }) : super(key: key);

  final String? text;
  final Icons? leadingIcon;
  final Icons? trailingIcon;
  final ButtonSize buttonSize;
  final ButtonType buttonType;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.iconOnly) {
      return _iconWrapper(
        icon: leadingIcon ?? trailingIcon,
        context: context,
      );
    }
    return Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment:
          fullWidth ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: <Widget>[
        if (leadingIcon != null) ...[
          _iconWrapper(icon: leadingIcon!, context: context),
          if (text != null) _textPadding,
        ],
        if (text != null) Text(text!),
        if (trailingIcon != null) ...[
          if (text != null) _textPadding,
          _iconWrapper(icon: trailingIcon!, context: context),
        ],
      ],
    );
  }

  Widget _iconWrapper({Icons? icon, required BuildContext context}) {
    if (icon == null) {
      return const EmptyWidget();
    }

    final double iconSize;
    if (buttonSize == ButtonSize.sizeMd) {
      iconSize = Sizes.size12;
    } else {
      iconSize = Sizes.size16;
    }

    return icon.iconCopyWith(
      color: IconTheme.of(context).color,
      size: iconSize,
    );
  }

  SpacingHorizontal get _textPadding {
    return buttonSize == ButtonSize.size2Xl
        ? const SpacingHorizontal.spacing12()
        : const SpacingHorizontal.spacing08();
  }
}
