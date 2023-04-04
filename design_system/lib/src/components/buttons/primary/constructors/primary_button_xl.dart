import 'package:flutter/material.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../primary_button_with_icon.dart';

class PrimaryButtonXl extends PrimaryButtonWithIcon {
  PrimaryButtonXl({
    super.key,
    super.onPressed,
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
