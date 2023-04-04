import 'package:authentication/src/ui/pages/reset_password/reset_password.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../data/params/params.dart';
import '../../widgets/authentication_background_image.dart';
import '../../widgets/button_back_to_login_widget.dart';
import '../../widgets/login_scaffold_widget.dart';

class ResetPasswordConfirmPage extends StatelessWidget with KeyboardMixin {
  const ResetPasswordConfirmPage({
    super.key,
    required this.presenter,
    required this.params,
  });

  final ResetPasswordConfirmPresenter presenter;
  final RemoteResetPasswordParams? params;

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: R.string.forgotPassword,
      subtile: R.string.registerNew8characterPassword,
      content: getContent(context),
      backgroundType: AuthenticationBackgroundType.resetPassword,
    );
  }

  Widget getContent(BuildContext context) {
    return Column(children: [
      ListenableBuilder(
        listenable: presenter,
        builder: (context) => InputBaseWidget(
          errorText: presenter.passwordErrorText,
          placeHolder: R.string.passwordMin8characters,
          obscureText: presenter.isPasswordObscure,
          onChanged: (value) => presenter.setPassword(value),
          onFocusChange: (focus) =>
              !focus ? presenter.validatePassword() : null,
          onFieldSubmitted: (_) => nextFocus(),
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
          errorText: presenter.passwordConfirmErrorText,
          placeHolder: R.string.confirmPassword,
          obscureText: presenter.isPasswordConfirmObscure,
          onChanged: (value) {
            presenter.setPasswordConfirm(
              value,
              presenter.password,
            );
            presenter.validatePasswordConfirm(presenter.password);
          },
          onFocusChange: (focus) => !focus
              ? presenter.validatePasswordConfirm(presenter.password)
              : null,
          trailingIcon: InputBaseWidget.getEyeWidget(
            context: context,
            obscure: presenter.isPasswordConfirmObscure,
            hasError: presenter.passwordConfirm != presenter.password,
            onPressed: () => presenter
                .setPasswordConfirmObscure(!presenter.isPasswordConfirmObscure),
          ),
          forceTrim: false,
        ),
      ),
      const SpacingVertical.spacing32(),
      ListenableBuilder(
        listenable: presenter,
        builder: (context) => TertiaryButton.sizeXl(
          onPressed:
              presenter.isFormValidated ? () => resetConfirm(context) : null,
          text: R.string.redefinePassword,
        ),
      ),
      const SpacingVertical.spacing24(),
      const ButtonBackToLoginWidget()
    ]);
  }

  Future<void> resetConfirm(BuildContext context) async {
    bool result = await presenter.confirm(
        params?.email ?? '', params?.code ?? '', context);
    shouldNavigateToNextScreen(context: context, success: result);
  }

  void shouldNavigateToNextScreen({
    required BuildContext context,
    required bool success,
  }) {
    if (success) {
      Navigator.of(context).pushNamed('/resetPasswordSuccess');
    }
  }
}
