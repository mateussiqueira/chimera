import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:profile/src/ui/pages/pages.dart';
import 'package:profile/src/ui/pages/profile/profile_enum.dart';
import 'package:profile/src/ui/styles/profile_module_style.dart';

import 'bottom_sheet/bottom_sheet.dart';

class MenuListWidget extends StatelessWidget with UIBottomSheetMixin {
  final ProfilePresenter presenter;

  const MenuListWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        final items = presenter.items;
        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            final item = items[index];
            final icon = item.icon;
            final name = item.name;
            var iconColor = moduleStyle.primary.textModulePrimaryColor(context);
            var textColor =
                moduleStyle.primary.textModuleStyleWithPrimaryColor(context);

            if (item == ProfileEnum.accountDeletion) {
              iconColor = moduleStyle.danger.textModulePrimaryColor(context);
              textColor =
                  moduleStyle.danger.textModuleStyleWithPrimaryColor(context);
            }

            return GestureDetector(
              onTap: () => onItemPressed(index, context),
              child: Row(
                children: [
                  icon.iconCopyWith(
                    color: iconColor,
                  ),
                  const SpacingHorizontal.spacing08(),
                  Expanded(
                    child: TextWidget.textSmMedium(
                      text: name,
                      style: textColor,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
              child: HorizontalDividerWidget(
                style: HorizontalDividerStyle(
                  dividerColor: moduleStyle.primary
                      .backgroundModuleTertiaryColor(context),
                ),
              ),
            );
          },
          itemCount: items.length,
        );
      },
    );
  }

  void onItemPressed(int index, BuildContext context) {
    final configuration = ConfigurationManager.menu;

    switch (presenter.item(index)) {
      case ProfileEnum.userTerms:
        presenter.openUrl(configuration.userTerms);
        break;
      case ProfileEnum.privacyPolicy:
        presenter.openUrl(configuration.privacyPolicy);
        break;
      case ProfileEnum.myCertificates:
        Navigator.of(context).pushNamed('/my-certificates/');
        break;
      case ProfileEnum.helpCenter:
        presenter.openUrl(configuration.helpCenter);
        break;
      case ProfileEnum.notifications:
        // TODO: Handle this case.
        break;
      case ProfileEnum.rateThisApp:
        _rateApp(context, presenter);
        break;
      case ProfileEnum.accountDeletion:
        Route66.pushNamed(
          '/account-deletion/',
        );
        break;
    }
  }

  Future<void> _rateApp(
      BuildContext context, ProfilePresenter presenter) async {
    if (await presenter.hasNetwork() == false) {
      return;
    }

    final String name = presenter.user?.name ?? '';
    // ignore: use_build_context_synchronously
    final rateThisApp = await showModalBS<bool>(
      context: context,
      body: RateThisAppBottomSheet(
        name: name,
      ),
    );

    if (await presenter.hasNetwork() == false) {
      return;
    }

    if (rateThisApp == false) {
      // ignore: use_build_context_synchronously
      final comment = await showModalBS(
        context: context,
        body: const WriteCommentBottomSheet(),
      );

      if (comment.runtimeType == String) {
        presenter.setUserRating(comment);
        await presenter.addUserRating();
      }
    } else if (rateThisApp == true) {
      final InAppReview inAppReview = InAppReview.instance;
      try {
        if (await inAppReview.isAvailable()) {
          await inAppReview.requestReview();
        } else {
          //TODO(kaiquegazola): ADD CONFIG WHITELABEL
          // await inAppReview.openStoreListing(appStoreId: '6444623350');
        }
      } catch (_) {
        ToastWidget.showGenericError();
      }
    }
  }
}
