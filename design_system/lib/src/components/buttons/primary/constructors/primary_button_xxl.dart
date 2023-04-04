import 'package:flutter/material.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../primary_button_with_icon.dart';

class PrimaryButton2Xl extends PrimaryButtonWithIcon {
  PrimaryButton2Xl({
    super.key,
    super.onPressed,
    super.focusNode,
    super.text,
    super.semanticLabel,
    super.leadingIcon,
    super.trailingIcon,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.buttonSize = ButtonSize.size2Xl,
    super.buttonType = ButtonType.normal,
  });
}
