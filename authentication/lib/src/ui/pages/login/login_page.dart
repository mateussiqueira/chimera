import 'package:authentication/src/ui/widgets/authentication_background_image.dart';
import 'package:authentication/src/ui/widgets/login_scaffold_widget.dart';
import 'package:authentication/src/ui/widgets/login_social_buttons_widget.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../styles/authentication_module_style.dart';
import 'login_presenter.dart';

class LoginPage extends StatelessWidget with KeyboardMixin {
  const LoginPage({
    super.key,
    required this.presenter,
  });

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: R.string.enterTitle,
      subtile: R.string.enterSubtitle,
      content: getContent(context),
      shouldComeBackToLoginOnClose: false,
      backgroundType: AuthenticationBackgroundType.login,
    );
  }

  Widget getContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListenableBuilder(
          listenable: presenter,
          builder: (context) => InputBaseWidget(
            errorText: presenter.emailErrorText,
            onChanged: (value) => presenter.setEmail(value),
            onFocusChange: (focus) => !focus ? presenter.validateEmail() : null,
            onFieldSubmitted: (value) => nextFocus(),
            placeHolder: R.string.email,
            textInputType: TextInputType.emailAddress,
          ),
        ),
        const SpacingVertical.spacing16(),
        ListenableBuilder(
          listenable: presenter,
          builder: (context) => InputBaseWidget(
            errorText: presenter.passwordErrorText,
            placeHolder: R.string.password,
            obscureText: presenter.isPasswordObscure,
            onChanged: (value) => presenter.setPassword(value),
            onFocusChange: (focus) =>
                !focus ? presenter.validatePassword() : null,
            onFieldSubmitted: (value) => doLogin(context),
            trailingIcon: InputBaseWidget.getEyeWidget(
              context: context,
              obscure: presenter.isPasswordObscure,
              hasError: presenter.passwordErrorText != null,
              onPressed: () =>
                  presenter.setPasswordObscure(!presenter.isPasswordObscure),
            ),
            forceTrim: false,
          ),
        ),
        TextButtonWidget(
          child: TextWidget.textSmBold(
            text: R.string.forgotPassword,
            style: moduleStyle.secondary
                .textModuleStyleWithSecondaryColor(context),
          ),
          onPressed: () => Navigator.of(context).pushNamed('/resetPasswordAsk'),
        ),
        const SpacingVertical.spacing20(),
        ListenableBuilder(
          listenable: presenter,
          builder: (context) => TertiaryButton.sizeXl(
            onPressed:
                presenter.isFormValidated ? () => doLogin(context) : null,
            text: R.string.enter,
          ),
        ),
        if (presenter.shouldShowLoginSocialButtons())
          Column(
            children: [
              const SpacingVertical.spacing32(),
              LoginSocialButtonsWidget(
                dividerText: R.string.orEnterWith,
                isAppleEnabled: presenter.isAppleEnabled(),
                isGoogleEnabled: presenter.isGoogleEnabled(),
                appleAuthAction: () async {
                  final result = await presenter.loginWithApple();
                  shouldNavigateToHome(context: context, success: result);
                },
                googleAuthAction: () async {
                  final result = await presenter.loginWithGoogle();
                  shouldNavigateToHome(context: context, success: result);
                },
              ),
            ],
          ),
        const SpacingVertical.spacing04(),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget.textSmNormal(
              text: R.string.doesntHaveAnAccount,
              style: moduleStyle.secondary
                  .textModuleStyleWithSecondaryColor(context),
            ),
            TextButtonWidget(
              child: TextWidget.textSmBold(
                text: R.string.doRegister,
                style: moduleStyle.quaternary
                    .textModuleStyleWithPrimaryColor(context),
              ),
              onPressed: () => Navigator.of(context)
                  .pushNamed('/register', arguments: <String, dynamic>{
                'cameFromLogin': true,
              }),
            )
          ],
        ),
      ],
    );
  }

  Future<void> doLogin(BuildContext context) async {
    final result = await presenter.doLogin(context);
    shouldNavigateToHome(context: context, success: result);
  }

  void shouldNavigateToHome({
    required BuildContext context,
    required bool success,
  }) {
    if (success) {
      Navigator.of(context).pop();
    }
  }
}
