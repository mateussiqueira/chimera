import 'package:flutter/material.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../secondary_button_with_icon.dart';

class SecondaryButtonMd extends SecondaryButtonWithIcon {
  SecondaryButtonMd({
    super.key,
    super.onPressed,
    super.style,
    super.focusNode,
    super.text,
    super.semanticLabel,
    super.leadingIcon,
    super.trailingIcon,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.buttonSize = ButtonSize.sizeMd,
    super.buttonType = ButtonType.normal,
    Color? backgroundColor,
  });
}
