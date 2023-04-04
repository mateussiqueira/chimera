import 'package:design_system/design_system.dart';

import '../styles/authentication_module_style.dart';

class LoginSocialButtonsWidget extends StatelessWidget {
  const LoginSocialButtonsWidget({
    super.key,
    required this.dividerText,
    required this.isAppleEnabled,
    required this.isGoogleEnabled,
    required this.appleAuthAction,
    required this.googleAuthAction,
  });

  final String dividerText;
  final bool isAppleEnabled;
  final bool isGoogleEnabled;
  final VoidCallback appleAuthAction;
  final VoidCallback googleAuthAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalDividerWidget(
          text: dividerText,
          style: HorizontalDividerStyle(
            dividerColor:
                moduleStyle.secondary.textModuleSecondaryColor(context),
            foregroundColor:
                moduleStyle.secondary.textModuleSecondaryColor(context),
          ),
        ),
        const SpacingVertical.spacing20(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isGoogleEnabled)
              GoogleSignInButton.icon(
                onPressed: googleAuthAction,
              ),
            if (isAppleEnabled && isGoogleEnabled)
              const SpacingHorizontal.spacing12(),
            if (isAppleEnabled)
              AppleSignInButton.icon(
                onPressed: appleAuthAction,
              ),
          ],
        ),
      ],
    );
  }
}
