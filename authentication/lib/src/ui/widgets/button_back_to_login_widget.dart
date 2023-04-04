import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../mixins/navigate_to_login_mixin.dart';
import '../styles/authentication_module_style.dart';

class ButtonBackToLoginWidget extends StatelessWidget
    with NavigateToLoginMixin {
  const ButtonBackToLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icons.arrowLeft.iconCopyWith(
            color: moduleStyle.secondary.textModuleSecondaryColor(context),
          ),
          const SpacingHorizontal.spacing12(),
          TextWidget.textSmMedium(
            text: R.string.backToLogin,
            style: moduleStyle.secondary
                .textModuleStyleWithSecondaryColor(context),
          )
        ],
      ),
      onPressed: () => {popToLogin(context)},
    );
  }
}
