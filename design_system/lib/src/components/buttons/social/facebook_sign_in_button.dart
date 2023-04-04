import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/buttons/button_type.dart';
import 'package:design_system/src/components/buttons/social/social_button.dart';
import 'package:design_system/src/components/buttons/social/social_button_style.dart';
import 'package:internationalization/internationalization.dart';

class FacebookSignInButton extends SocialButton {
  FacebookSignInButton({
    super.key,
    super.onPressed,
  }) : super(
          text: R.string.signInWithFacebook,
          icon: Icons.facebookButton,
          style: SocialButtonStyle.facebook(appContext),
          type: ButtonType.normal,
        );

  FacebookSignInButton.icon({
    super.key,
    super.onPressed,
  }) : super(
          text: R.string.signInWithFacebook,
          icon: Icons.facebookButton,
          style: SocialButtonStyle.facebookIcon(appContext),
          type: ButtonType.iconOnly,
        );
}
