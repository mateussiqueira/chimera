import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/assessment/assessment.dart';
import 'package:learning/src/ui/pages/assessment/widgets/widgets.dart';
import 'package:learning/src/ui/pages/content/widgets/kinds/kinds.dart';
import 'package:learning/src/ui/pages/course/course.dart';

import 'assessment_preview_widget.dart';
import 'expandable_fade_content_widget.dart';

class ContentPreviewWidget extends StatelessWidget with UIBottomSheetMixin {
  const ContentPreviewWidget({
    Key? key,
    required this.content,
    required this.presenter,
    required this.height,
  }) : super(key: key);

  final ContentEntity content;
  final CoursePresenter presenter;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GestureDetector(
        child: _content,
        onTap: () async {
          if (content.coreKind == ContentKind.assessment) {
            showModalBS(
              context: context,
              body: AttemptsBottomSheet(
                enrollment: presenter.enrollment,
                content: content,
                presenter: Alligator().call<AttemptsPresenter>(),
              ),
            );
          } else {
            await Navigator.of(context).pushNamed(
              '/learning/content',
              arguments: <String, dynamic>{
                'content': content,
                'enrollment': presenter.enrollment,
              },
            );
          }

          presenter.reload();
        },
      ),
    );
  }

  Widget get _content {
    switch (content.coreKind) {
      case ContentKind.video:
        return Stack(
          alignment: Alignment.center,
          children: [
            ExpandableFadeContentWidget(
              title: _contentName,
              showExpandButton: false,
              child: const ImageWidget(
                image: Images.videoPlaceholder,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icons.playButton.icon,
            ),
          ],
        );
      case ContentKind.hyperText:
        return ExpandableFadeContentWidget(
          title: _contentName,
          child: ContentHyperTextRenderWidget(content: content),
        );
      case ContentKind.document:
        return ExpandableFadeContentWidget(
          title: _contentName,
          child: WebViewWidget(
            url: _contentUrl,
          ),
        );
      case ContentKind.assessment:
        return AssessmentPreviewWidget(
          title: _contentName,
          numberOfAttemptsLeft: _numberOfAttemptsLeft(),
        );
      default:
        return const EmptyWidget();
    }
  }

  String get _contentName => content.name ?? '';
  String get _contentUrl => content.url ?? '';

  int _numberOfAttemptsLeft() {
    var assessmentProgress = presenter.enrollment?.assessmentProgresses
        ?.firstWhereOrNull((e) => e.assessment?.id == content.coreId);
    int maxAttempts = assessmentProgress?.assessment?.maxAttempts ?? 0;
    int attemptsLength = assessmentProgress?.attempts?.length ?? 0;
    return maxAttempts - attemptsLength;
  }
}
