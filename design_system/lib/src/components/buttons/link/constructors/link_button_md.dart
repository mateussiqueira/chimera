import 'package:design_system/design_system.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../link_button_with_icon.dart';

class LinkButtonMd extends LinkButtonWithIcon {
  LinkButtonMd({
    super.key,
    super.onPressed,
    super.focusNode,
    super.text,
    super.semanticLabel,
    super.leadingIcon,
    super.trailingIcon,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.buttonSize = ButtonSize.sizeMd,
    super.buttonType = ButtonType.normal,
    super.foregroundColor,
    super.foregroundDisabledColor,
    super.foregroundPressedColor,
  });
}
