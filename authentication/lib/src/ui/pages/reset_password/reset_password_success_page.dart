import 'package:authentication/src/ui/mixins/navigate_to_login_mixin.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../styles/authentication_module_style.dart';
import '../../widgets/authentication_background_image.dart';
import '../../widgets/login_scaffold_widget.dart';

class ResetPasswordSuccessPage extends StatelessWidget
    with NavigateToLoginMixin {
  const ResetPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      content: getContent(context),
      shouldComeBackToLoginOnClose: true,
      backgroundType: AuthenticationBackgroundType.resetPassword,
    );
  }

  Widget getContent(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        width: Sizes.size64,
        height: Sizes.size64,
        decoration: BoxDecoration(
            color:
                moduleStyle.secondary.backgroundModuleSecondaryColor(context),
            shape: BoxShape.circle),
        child: Center(
          child: Icons.check.iconCopyWith(
              color: moduleStyle.secondary.textModulePrimaryColor(context),
              size: Sizes.size32),
        ),
      ),
      const SpacingVertical.spacing24(),
      TextWidget.textXlBold(
        text: R.string.passwordReset,
        textAlign: TextAlign.center,
        style: moduleStyle.secondary.textModuleStyleWithPrimaryColor(context),
      ),
      const SpacingVertical.spacing08(),
      TextWidget.textMdNormal(
        text: R.string.backToInitialScreenAndDoLogin,
        style: moduleStyle.secondary.textModuleStyleWithSecondaryColor(context),
      ),
      const SpacingVertical.spacing32(),
      TertiaryButton.sizeXl(
        onPressed: () => popToLogin(context),
        text: R.string.doLogin,
      ),
    ]);
  }
}
