import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/buttons/button_type.dart';
import 'package:design_system/src/components/buttons/social/social_button.dart';
import 'package:design_system/src/components/buttons/social/social_button_style.dart';
import 'package:internationalization/internationalization.dart';

class AppleSignInButton extends SocialButton {
  AppleSignInButton({
    super.key,
    super.onPressed,
  }) : super(
          text: R.string.signInWithApple,
          icon: Icons.appleButton,
          style: SocialButtonStyle.apple(appContext),
          type: ButtonType.normal,
        );

  AppleSignInButton.icon({
    super.key,
    super.onPressed,
  }) : super(
          text: R.string.signInWithApple,
          icon: Icons.socialApple,
          style: SocialButtonStyle.appleIcon(appContext),
          type: ButtonType.iconOnly,
        );
}
