import 'package:design_system/design_system.dart';

import 'question_navigation/question_navigation.dart';
import 'question_navigation_presenter_mixin.dart';

class QuestionNavigationWidget extends StatelessWidget {
  const QuestionNavigationWidget({
    Key? key,
    required this.presenter,
    required this.send,
  }) : super(key: key);

  final QuestionNavigationPresenterMixin presenter;
  final VoidCallback send;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionNavigationItems(
          presenter: presenter,
        ),
        QuestionNavigationOptions(
          presenter: presenter,
          send: send,
        ),
      ],
    );
  }
}
