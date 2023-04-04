import 'package:flutter/material.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../tertiary_button_with_icon.dart';

class TertiaryButtonXl extends TertiaryButtonWithIcon {
  TertiaryButtonXl({
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
    super.buttonSize = ButtonSize.sizeXl,
    super.buttonType = ButtonType.normal,
  });
}
