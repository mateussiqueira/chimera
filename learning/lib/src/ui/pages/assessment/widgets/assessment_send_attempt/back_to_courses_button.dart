import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/assessment/after_send_action.dart';

class BackToCoursesButton extends StatelessWidget {
  const BackToCoursesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SecondaryButton.sizeXl(
        text: R.string.backToCourses,
        onPressed: action,
      ),
    );
  }

  void action() {
    Route66.pop(result: AfterSendAction.backToCourses);
  }
}
