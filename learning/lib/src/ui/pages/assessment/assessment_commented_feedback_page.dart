import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class AssessmentCommentedFeedback extends StatelessWidget {
  const AssessmentCommentedFeedback({
    super.key,
    required this.comment,
  });

  final String? comment;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: SecondaryAppBarWidget(
        title: R.string.commentedFeedback,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: HtmlRenderWidget(
          html: comment ?? '',
        ),
      ),
    );
  }
}
