import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/buttons/button_type.dart';
import 'package:design_system/src/components/buttons/social/social_button.dart';
import 'package:design_system/src/components/buttons/social/social_button_style.dart';
import 'package:internationalization/internationalization.dart';

class GoogleSignInButton extends SocialButton {
  GoogleSignInButton({
    super.key,
    super.onPressed,
  }) : super(
          text: R.string.signInWithGoogle,
          icon: Icons.googleButton,
          style: SocialButtonStyle.google(appContext),
          type: ButtonType.normal,
        );

  GoogleSignInButton.icon({
    super.key,
    super.onPressed,
  }) : super(
          text: R.string.signInWithGoogle,
          icon: Icons.googleButton,
          style: SocialButtonStyle.googleIcon(appContext),
          type: ButtonType.iconOnly,
        );
}
