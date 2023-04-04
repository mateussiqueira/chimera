import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../../styles/learning_module_style.dart';

class AssessmentPercentageWidget extends StatelessWidget {
  const AssessmentPercentageWidget({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget.textSmNormal(
          text: R.string.score,
          style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
        ),
        TextWidget.textSmBold(
          text: '$percentage%',
          style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
        ),
      ],
    );
  }
}
