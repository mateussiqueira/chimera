import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class CertificateEmptyWidget extends StatelessWidget {
  const CertificateEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IllustrationImageWidget(
          image: Images.illustrationEmptyStateCourses,
          title: R.string.certificateEmptyTitle,
          subTitle: R.string.certificateEmptySubtitle,
        ),
        const SpacingVertical.spacing20(),
        SizedBox(
          width: Sizes.sizeInfinity,
          child: PrimaryButton.sizeXl(
            text: R.string.gotoMyCourses,
            onPressed: () {
              Route66.pop(rootNavigator: false);
              Route66.pushReplacementNamed('/learning/', rootNavigator: false);
            },
          ),
        ),
      ],
    );
  }
}
