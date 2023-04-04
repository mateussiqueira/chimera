import 'package:authentication/src/ui/pages/register/register.dart';
import 'package:authentication/src/ui/widgets/authentication_background_image.dart';
import 'package:authentication/src/ui/widgets/login_scaffold_widget.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../mixins/navigate_to_login_mixin.dart';
import '../../styles/authentication_module_style.dart';
import '../../widgets/login_social_buttons_widget.dart';

class RegisterPage extends StatelessWidget
    with NavigateToLoginMixin, KeyboardMixin {
  const RegisterPage({
    super.key,
    required this.presenter,
    required this.cameFromLogin,
  });

  final RegisterPresenter presenter;
  final bool cameFromLogin;

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: R.string.doRegister,
      subtile: R.string.comeToThisCommunity,
      content: getContent(context),
      backgroundType: AuthenticationBackgroundType.register,
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
            placeHolder: R.string.passwordMin8characters,
            obscureText: presenter.isPasswordObscure,
            onChanged: (value) => presenter.setPassword(value),
            onFocusChange: (focus) =>
                !focus ? presenter.validatePassword() : null,
            onFieldSubmitted: (value) => nextFocus(),
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
        const SpacingVertical.spacing16(),
        ListenableBuilder(
          listenable: presenter,
          builder: (context) => InputBaseWidget(
            errorText: presenter.firstNameErrorText,
            onChanged: (value) => presenter.setFirstName(value),
            onFocusChange: (focus) =>
                !focus ? presenter.validateFirstName() : null,
            onFieldSubmitted: (value) => nextFocus(),
            placeHolder: R.string.firstName,
          ),
        ),
        const SpacingVertical.spacing16(),
        ListenableBuilder(
          listenable: presenter,
          builder: (context) => InputBaseWidget(
            errorText: presenter.surnameErrorText,
            onChanged: (value) => presenter.setSurname(value),
            onFocusChange: (focus) =>
                !focus ? presenter.validateSurname() : null,
            onFieldSubmitted: (value) => doRegister(context),
            placeHolder: R.string.surname,
          ),
        ),
        const SpacingVertical.spacing08(),
        TextWidget.textSmNormal(
          text: R.string.fullNameIssuedInCertificate,
          style:
              moduleStyle.secondary.textModuleStyleWithSecondaryColor(context),
        ),
        const SpacingVertical.spacing32(),
        ListenableBuilder(
          listenable: presenter,
          builder: (context) => TertiaryButton.sizeXl(
            onPressed:
                presenter.isFormValidated ? () => doRegister(context) : null,
            text: R.string.register,
          ),
        ),
        if (presenter.shouldShowLoginSocialButtons())
          Column(
            children: [
              const SpacingVertical.spacing64(),
              LoginSocialButtonsWidget(
                dividerText: R.string.orRegisterWith,
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
              text: R.string.doYouHaveAnAccountAlready,
              style: moduleStyle.secondary
                  .textModuleStyleWithSecondaryColor(context),
            ),
            const SpacingHorizontal.spacing04(),
            TextButtonWidget(
              child: TextWidget.textSmBold(
                text: R.string.enterNow,
                style: moduleStyle.quaternary
                    .textModuleStyleWithPrimaryColor(context),
              ),
              onPressed: () => navigateToLogin(context),
            ),
          ],
        ),
      ],
    );
  }

  void navigateToLogin(BuildContext context) {
    if (cameFromLogin) {
      Route66.pop();
    } else {
      Route66.pushReplacementNamed('/login-dialog');
    }
  }

  Future<void> doRegister(BuildContext context) async {
    bool result = await presenter.register(context);
    shouldNavigateToHome(context: context, success: result);
  }

  void shouldNavigateToHome({
    required BuildContext context,
    required bool success,
  }) {
    if (success) {
      popToRoot(context);
    }
  }
}
