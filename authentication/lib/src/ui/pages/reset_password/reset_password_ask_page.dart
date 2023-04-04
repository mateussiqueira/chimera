import 'package:authentication/src/ui/pages/reset_password/reset_password.dart';
import 'package:authentication/src/ui/widgets/button_back_to_login_widget.dart';
import 'package:authentication/src/ui/widgets/login_scaffold_widget.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../data/data.dart';
import '../../widgets/authentication_background_image.dart';

class ResetPasswordAskPage extends StatelessWidget {
  const ResetPasswordAskPage({
    super.key,
    required this.presenter,
  });

  final ResetPasswordAskPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: R.string.forgotPassword,
      subtile: R.string.weWillSendTheCodeToEmail,
      content: getContent(context),
      backgroundType: AuthenticationBackgroundType.resetPassword,
    );
  }

  Widget getContent(BuildContext context) {
    return Column(children: [
      ListenableBuilder(
        listenable: presenter,
        builder: (context) => InputBaseWidget(
          errorText: presenter.emailErrorText,
          onChanged: ((value) => presenter.setEmail(value)),
          onFocusChange: (focus) => !focus ? presenter.validateEmail() : null,
          placeHolder: R.string.email,
        ),
      ),
      const SpacingVertical.spacing32(),
      ListenableBuilder(
        listenable: presenter,
        builder: (context) => TertiaryButton.sizeXl(
          onPressed: presenter.isFormValidated ? () => resetAsk(context) : null,
          text: R.string.sendEmail,
        ),
      ),
      const SpacingVertical.spacing24(),
      const ButtonBackToLoginWidget()
    ]);
  }

  Future<void> resetAsk(BuildContext context) async {
    bool result = await presenter.ask(context);
    shouldNavigateToNextScreen(context: context, success: result);
  }

  void shouldNavigateToNextScreen({
    required BuildContext context,
    required bool success,
  }) {
    if (success) {
      Navigator.of(context).pushNamed(
        '/resetPasswordCode',
        arguments: RemoteResetPasswordParams(
            email: presenter.email ?? '', code: '', password: ''),
      );
    }
  }
}
