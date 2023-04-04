import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'list_icon_widget.dart';

class ProductExpectationsWidget extends StatelessWidget {
  const ProductExpectationsWidget({
    Key? key,
    required this.presenter,
    required this.durationInHours,
  }) : super(key: key);

  final UpdatePresenter presenter;
  final int? durationInHours;

  @override
  Widget build(BuildContext context) {
    final hours = durationInHours ?? 16;
    final expectations = _expectations(hours);
    final expectationsIcons = _expectationsIcons(hours);
    return Column(
      children: [
        SectionHeaderWidget(title: R.string.courseExpectationsTitle),
        const SpacingVertical.spacing12(),
        ExpandWidget(
          collapsedHeight: Sizes.size184,
          expandText: R.string.seeMore,
          retractText: R.string.seeLess,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size04,
              horizontal: Sizes.size12,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return ListIconWidget(
                  text: expectations[index],
                  icon: expectationsIcons[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SpacingVertical.spacing12();
              },
              itemCount: expectations.length,
            ),
          ),
        )
      ],
    );
  }

  List<String> _expectations(int durationInHours) => [
        R.string.contentExpectationDescription(durationInHours),
        R.string.courseDeviceCompatibility,
        R.string.courseCertificateSign,
      ];

  List<Icons> _expectationsIcons(int durationInHours) => [
        Icons.playCircle,
        Icons.monitor05,
        Icons.certificate02,
      ];
}
