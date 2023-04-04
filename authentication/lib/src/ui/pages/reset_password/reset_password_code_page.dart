import 'package:authentication/src/data/params/params.dart';
import 'package:authentication/src/ui/pages/reset_password/reset_password.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../styles/authentication_module_style.dart';
import '../../widgets/authentication_background_image.dart';
import '../../widgets/button_back_to_login_widget.dart';
import '../../widgets/login_scaffold_widget.dart';

class ResetPasswordCodePage extends StatelessWidget {
  const ResetPasswordCodePage({
    super.key,
    required this.presenter,
    required this.params,
  });

  final ResetPasswordCodePresenter presenter;
  final RemoteResetPasswordParams? params;

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: R.string.forgotPassword,
      subtile: R.string.fillTheCode,
      content: getContent(context),
      backgroundType: AuthenticationBackgroundType.resetPassword,
    );
  }

  Widget getContent(BuildContext context) {
    return Column(children: [
      ListenableBuilder(
        listenable: presenter,
        builder: (context) => InputBaseWidget(
          onChanged: ((value) => presenter.setCode(value)),
          placeHolder: R.string.sixDigitsCode,
          textInputType: TextInputType.number,
          maxLength: 6,
        ),
      ),
      Row(
        children: [
          TextWidget.textSmNormal(
            text: R.string.dintReceivedTheCode,
            style: moduleStyle.secondary
                .textModuleStyleWithSecondaryColor(context),
          ),
          const SpacingHorizontal.spacing04(),
          ListenableBuilder(
            listenable: presenter,
            builder: (context) => resendWidget(context),
          ),
        ],
      ),
      const SpacingVertical.spacing40(),
      ListenableBuilder(
        listenable: presenter,
        builder: (context) => TertiaryButton.sizeXl(
          onPressed: presenter.isFormValidated
              ? () => resetValidateCode(context)
              : null,
          text: R.string.confirm,
        ),
      ),
      const SpacingVertical.spacing24(),
      const ButtonBackToLoginWidget()
    ]);
  }

  Widget resendWidget(BuildContext context) {
    if (presenter.shouldShowResendEmail()) {
      return TextButtonWidget(
          child: TextWidget.textSmBold(
            text: R.string.resendEmail,
            style: moduleStyle.secondary
                .textModuleStyleWithSecondaryColor(context),
          ),
          onPressed: () async {
            presenter.resendEmail(params?.email ?? '', context);
          });
    } else {
      return TextWidget.textSmNormal(
        text: "${presenter.secondsRemaining} ${R.string.secondsToResend}",
        style: moduleStyle.secondary.textModuleStyleWithSecondaryColor(context),
      );
    }
  }

  Future<void> resetValidateCode(BuildContext context) async {
    bool result = await presenter.validateCode(params?.email ?? '', context);
    shouldNavigateToNextScreen(context: context, success: result);
  }

  void shouldNavigateToNextScreen({
    required BuildContext context,
    required bool success,
  }) {
    if (success) {
      Navigator.of(context).pushNamed(
        '/resetPasswordConfirm',
        arguments: RemoteResetPasswordParams(
            email: params?.email ?? '',
            code: presenter.code ?? '',
            password: ''),
      );
    }
  }
}
