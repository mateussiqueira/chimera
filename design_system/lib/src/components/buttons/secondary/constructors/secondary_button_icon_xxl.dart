import 'package:design_system/design_system.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../secondary_button_with_icon.dart';

class SecondaryButtonIcon2Xl extends SecondaryButtonWithIcon {
  SecondaryButtonIcon2Xl({
    super.key,
    super.onPressed,
    super.semanticLabel,
    required Icons icon,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.buttonSize = ButtonSize.size2Xl,
    super.buttonType = ButtonType.iconOnly,
    Color? backgroundColor,
  }) : super(leadingIcon: icon);
}
