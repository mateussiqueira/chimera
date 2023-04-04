import 'package:design_system/design_system.dart';

import '../../button_size.dart';
import '../../button_type.dart';
import '../primary_button_with_icon.dart';

class PrimaryButtonIconXl extends PrimaryButtonWithIcon {
  PrimaryButtonIconXl({
    super.key,
    super.onPressed,
    super.semanticLabel,
    required Icons icon,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.buttonSize = ButtonSize.sizeXl,
    super.buttonType = ButtonType.iconOnly,
  }) : super(leadingIcon: icon);
}
