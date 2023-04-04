import 'package:authentication/src/ui/mixins/navigate_to_login_mixin.dart';
import 'package:design_system/design_system.dart';

import '../styles/authentication_module_style.dart';
import 'authentication_background_image.dart';
import 'login_background_widget.dart';

class LoginScaffold extends StatelessWidget with NavigateToLoginMixin {
  const LoginScaffold({
    super.key,
    this.title,
    this.subtile,
    this.shouldComeBackToLoginOnClose = false,
    required this.content,
    this.backgroundType = AuthenticationBackgroundType.login,
  });

  final String? title;
  final String? subtile;
  final bool shouldComeBackToLoginOnClose;
  final Widget content;
  final AuthenticationBackgroundType backgroundType;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      forceSafeArea: false,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: LoginBackgroundWidget(
              backgroundType: backgroundType,
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacings.spacing16,
                      vertical: Spacings.spacing16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () => pop(context),
                              icon: Icons.xClose.iconCopyWith(
                                color: moduleStyle.secondary
                                    .textModulePrimaryColor(context),
                                size: Sizes.size24,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            ImageWidget(
                              image: Images.logoMark,
                            ),
                          ],
                        ),
                        const SpacingVertical.spacing80(),
                        if (title != null)
                          TextWidget.displayXxlBold(
                            text: title!,
                            style: moduleStyle.secondary
                                .textModuleStyleWithPrimaryColor(context),
                          ),
                        if (subtile != null) const SpacingVertical.spacing08(),
                        if (subtile != null)
                          TextWidget.textMdNormal(
                            text: subtile!,
                            style: moduleStyle.secondary
                                .textModuleStyleWithSecondaryColor(context),
                          ),
                        const SpacingVertical.spacing32(),
                        Expanded(child: content),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pop(BuildContext context) {
    shouldComeBackToLoginOnClose
        ? popToLogin(context)
        : Navigator.of(context).pop();
  }
}
