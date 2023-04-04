import 'package:flutter/material.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../secondary_button_with_icon.dart';

class SecondaryButton2Xl extends SecondaryButtonWithIcon {
  SecondaryButton2Xl({
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
    super.buttonSize = ButtonSize.size2Xl,
    super.buttonType = ButtonType.normal,
    super.backgroundColor,
  });
}
