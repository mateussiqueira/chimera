import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/assessment/widgets/question_navigation_presenter_mixin.dart';

import '../../../../styles/learning_module_style.dart';

class QuestionNavigationOptions extends StatelessWidget {
  const QuestionNavigationOptions({
    required this.presenter,
    required this.send,
    super.key,
  });

  final QuestionNavigationPresenterMixin presenter;
  final VoidCallback send;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: presenter.canGoBack() ? 1 : 0.6,
          child: SecondaryButton.iconXl(
            icon: Icons.arrowLeft,
            onPressed: presenter.canGoBack()
                ? () {
                    presenter.back();
                    presenter.setOpen(false);
                  }
                : null,
          ),
        ),
        const SpacingHorizontal.spacing08(),
        SecondaryButton.iconXl(
          icon: Icons.map01,
          onPressed: () => presenter.toggleOpen(),
          backgroundColor: presenter.isOpen()
              ? moduleStyle.tertiary.backgroundModuleSecondaryColor(context)
              : moduleStyle.tertiary.backgroundModulePrimaryColor(context),
        ),
        if (presenter.showForwardButton()) ...[
          const SpacingHorizontal.spacing08(),
          Opacity(
            opacity: presenter.canGoForward() ? 1 : 0.6,
            child: SecondaryButton.iconXl(
              icon: Icons.arrowRight,
              onPressed: presenter.canGoForward()
                  ? () {
                      presenter.forward();
                      presenter.setOpen(false);
                    }
                  : null,
            ),
          ),
        ],
        if (presenter.showSendButton()) ...[
          const SpacingHorizontal.spacing08(),
          SizedBox(
            width: Sizes.size128,
            child: PrimaryButton.sizeXl(
              text: R.string.send,
              trailingIcon: Icons.arrowRight,
              onPressed: () {
                presenter.setOpen(false);
                send();
              },
            ),
          ),
        ]
      ],
    );
  }
}
