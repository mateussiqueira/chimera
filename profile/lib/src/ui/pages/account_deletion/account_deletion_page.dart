import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:profile/src/ui/ui.dart';

import 'widgets/widgets.dart';

class AccountDeletionPage extends StatelessWidget with UIBottomSheetMixin {
  const AccountDeletionPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final AccountDeletionPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: SecondaryAppBarWidget(title: R.string.accountDeletion),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacings.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget.textSmBold(
              text: R.string.accountDeletionTitle,
              style:
                  moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
            ),
            const SpacingVertical.spacing12(),
            _normalTextWidget(
              R.string.accountDeletionLosingWarning,
              context,
            ),
            const SpacingVertical.spacing08(),
            _dotListPadding(
              R.string.accountDeletionLosingList,
              context,
            ),
            const SpacingVertical.spacing08(),
            _normalTextWidget(
              R.string.accountDeletionRefund,
              context,
            ),
            const SpacingVertical.spacing08(),
            _normalTextWidget(
              R.string.accountDeletionCertificateWarning,
              context,
            ),
            const SpacingVertical.spacing08(),
            _normalTextWidget(
              R.string.accountDeletionConfirmationQuestion,
              context,
            ),
            const SpacingVertical.spacing48(),
            SizedBox(
              width: Sizes.sizeInfinity,
              child: PrimaryButton.sizeMd(
                text: R.string.accountDeletion,
                onPressed: () => confirmDelete(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _normalTextWidget(String text, BuildContext context) {
    return TextWidget.textSmNormal(
      text: text,
      style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
    );
  }

  Widget _dotListPadding(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.size08,
      ),
      child: TextWidget.textSmNormal(
        text: text,
        style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
      ),
    );
  }

  Future<void> confirmDelete(BuildContext context) async {
    final result = await showModalBS<bool>(
      context: context,
      body: DeletionConfirmationBottomSheet(
        presenter: presenter,
      ),
    );
    if (result == true) {
      final deleted = await presenter.delete();
      if (deleted) {
        Route66.pop();
      }
    }
  }
}
