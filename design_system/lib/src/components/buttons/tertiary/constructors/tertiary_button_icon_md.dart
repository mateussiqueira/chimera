import 'package:design_system/design_system.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../tertiary_button_with_icon.dart';

class TertiaryButtonIconMd extends TertiaryButtonWithIcon {
  TertiaryButtonIconMd({
    super.key,
    super.onPressed,
    super.semanticLabel,
    required Icons icon,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.buttonSize = ButtonSize.sizeMd,
    super.buttonType = ButtonType.iconOnly,
  }) : super(leadingIcon: icon);
}
