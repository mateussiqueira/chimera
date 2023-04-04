import 'package:design_system/design_system.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../secondary_button_with_icon.dart';

class SecondaryButtonIconMd extends SecondaryButtonWithIcon {
  SecondaryButtonIconMd({
    super.key,
    super.onPressed,
    super.semanticLabel,
    required Icons icon,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.buttonSize = ButtonSize.sizeMd,
    super.buttonType = ButtonType.iconOnly,
    Color? backgroundColor,
  }) : super(leadingIcon: icon);
}
