import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/my_enrollments/my_enrollments.dart';

class EnrollmentsNoAuthenticationWidget extends StatelessWidget {
  const EnrollmentsNoAuthenticationWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final MyEnrollmentsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IllustrationImageWidget(
            image: Images.illustrationEmptyStateAuthentication,
            title: R.string.noAuthenticationTitle,
            subTitle: R.string.noAuthenticationSubtitle,
          ),
          const SpacingVertical.spacing20(),
          SizedBox(
            width: double.infinity,
            child: PrimaryButton.sizeXl(
              text: R.string.doLoginButton,
              onPressed: () async {
                Marcopolo().emit(DoLoginEvent());
              },
            ),
          ),
          const SpacingVertical.spacing08(),
          SizedBox(
            width: double.infinity,
            child: SecondaryButton.sizeXl(
              text: R.string.doRegisterButton,
              onPressed: () async {
                Marcopolo().emit(DoRegisterEvent());
              },
            ),
          ),
          const SpacingVertical.spacing16(),
        ],
      ),
    );
  }
}
