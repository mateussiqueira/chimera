import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:profile/src/ui/ui.dart';

import '../../widgets/widgets.dart';

class ProfileUserWidget extends StatelessWidget with UIBottomSheetMixin {
  const ProfileUserWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final ProfilePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        final user = presenter.user;
        final isLoading = presenter.isUserLoggedIn() == null;
        if (isLoading) {
          return const EmptyWidget();
        }
        if (user == null) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IllustrationImageWidget(
                image: Images.illustrationEmptyStateProfile,
                title: R.string.doLoginProfile,
                subTitle: R.string.doLoginOrRegisterProfile,
              ),
              const SpacingVertical.spacing16(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: PrimaryButton.sizeXl(
                      text: R.string.doLogin,
                      onPressed: () async {
                        Marcopolo().emit(DoLoginEvent());
                      },
                    ),
                  ),
                  const SpacingHorizontal.spacing12(),
                  Flexible(
                    child: SecondaryButton.sizeXl(
                      text: R.string.doRegister,
                      onPressed: () async {
                        Marcopolo().emit(DoRegisterEvent());
                      },
                    ),
                  ),
                ],
              ),
              const SpacingVertical.spacing24(),
            ],
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: moduleStyle.primary
                        .backgroundModuleSecondaryColor(context),
                    child: Icons.user01.iconCopyWith(
                      color:
                          moduleStyle.primary.textModuleSecondaryColor(context),
                    ),
                  ),
                  const SpacingHorizontal.spacing16(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TextWidget.textSmBold(
                            text: user.name,
                            style: moduleStyle.primary
                                .textModuleStyleWithPrimaryColor(context),
                          ),
                        ),
                        const SpacingVertical.spacing04(),
                        Flexible(
                          child: TextWidget.textSmNormal(
                            text: user.email,
                            style: moduleStyle.primary
                                .textModuleStyleWithPrimaryColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => logout(context),
                    icon: Icons.logOut01.iconCopyWith(
                      color:
                          moduleStyle.primary.textModulePrimaryColor(context),
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              const SpacingVertical.spacing16(),
              HorizontalDividerWidget(
                style: HorizontalDividerStyle(
                  dividerColor: moduleStyle.primary
                      .backgroundModuleTertiaryColor(context),
                ),
              ),
              const SpacingVertical.spacing16(),
            ],
          );
        }
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    var result = await showModalBS<bool>(
      context: context,
      body: const LogoutBottomSheet(),
    );
    if (result == true) {
      await presenter.logout();
    }
  }
}
