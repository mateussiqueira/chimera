import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class EnrollmentsEmptyWidget extends StatelessWidget {
  const EnrollmentsEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IllustrationImageWidget(
          image: Images.illustrationEmptyStateCourses,
          title: R.string.emptyStateTitle,
          subTitle: R.string.emptyStateSubtitle,
        ),
        const SpacingVertical.spacing20(),
      ],
    );
  }
}
