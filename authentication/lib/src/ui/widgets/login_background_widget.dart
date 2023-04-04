import 'package:design_system/design_system.dart';

import 'authentication_background_image.dart';

class LoginBackgroundWidget extends StatelessWidget {
  const LoginBackgroundWidget({
    super.key,
    this.backgroundType = AuthenticationBackgroundType.login,
  });

  final AuthenticationBackgroundType backgroundType;

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      image: _backgroundImage,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.fitWidth,
    );
  }

  Images get _backgroundImage {
    switch (backgroundType) {
      case AuthenticationBackgroundType.login:
        return Images.backgroundLogin;
      case AuthenticationBackgroundType.register:
        return Images.backgroundRegister;
      case AuthenticationBackgroundType.resetPassword:
        return Images.backgroundResetPassword;
    }
  }
}
