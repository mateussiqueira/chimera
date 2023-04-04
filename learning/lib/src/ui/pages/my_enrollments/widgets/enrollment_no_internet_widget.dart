import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class EnrollmentsNoConnectionWidget extends StatelessWidget {
  const EnrollmentsNoConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IllustrationImageWidget(
          image: Images.illustrationEmptyStateNoConnection,
          title: R.string.verifyConnection,
          subTitle: R.string.noConnectionDescription,
        ),
      ],
    );
  }
}
