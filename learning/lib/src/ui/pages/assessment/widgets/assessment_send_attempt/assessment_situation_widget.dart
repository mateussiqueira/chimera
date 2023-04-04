import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../../styles/learning_module_style.dart';

class AssessmentSituationWidget extends StatelessWidget {
  const AssessmentSituationWidget({
    Key? key,
    required this.approved,
  }) : super(key: key);

  final bool approved;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget.textSmNormal(
          text: R.string.situation,
          style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
        ),
        _situation(context),
      ],
    );
  }

  Widget _situation(BuildContext context) {
    final text = approved ? R.string.approved : R.string.failed;
    final color = approved
        ? moduleStyle.success.textModulePrimaryColor(context)
        : moduleStyle.danger.textModulePrimaryColor(context);
    return TextWidget.textSmBold(
      text: text,
      style: TextStyle(
        color: color,
      ),
    );
  }
}
