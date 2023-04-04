import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/pages.dart';

import '../../assessment/widgets/widgets.dart';
import 'content/content.dart';

class CourseContentTab extends StatelessWidget
    with ScrollMixin, UIBottomSheetMixin {
  CourseContentTab({
    Key? key,
    required this.presenter,
    required this.scrollController,
  }) : super(key: key);

  final CoursePresenter presenter;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListenableBuilder(
            listenable: presenter,
            builder: (context) {
              final selectedContent = presenter.selectedContent;
              if (selectedContent != null) {
                return ResponsiveLayoutWidget(
                  mobile: (context) => ContentPreviewWidget(
                    content: selectedContent,
                    presenter: presenter,
                    height: 190,
                  ),
                  tablet: (context) => ContentPreviewWidget(
                    content: selectedContent,
                    presenter: presenter,
                    height: 305,
                  ),
                );
              }
              return const EmptyWidget();
            },
          ),
          const SpacingVertical.spacing12(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            child: _content,
          ),
        ],
      ),
    );
  }

  Widget get _content {
    return Column(
      children: [
        //TODO(kaiquegazola): add extra material when backend provide
        //const ExtraMaterialButton(),
        //const SpacingVertical.spacing12(),
        ListenableBuilder(
          listenable: presenter,
          builder: (context) {
            final nodes = presenter.course?.tree?.nodes;
            if (nodes != null) {
              return NodesGeneratorWidget(
                assessmentsProgresses:
                    presenter.enrollment?.assessmentProgresses,
                nodes: nodes,
                onClickContent: (ContentEntity content) {
                  presenter.selectContent(content);
                  scrollListToStart(controller: scrollController);
                  if (content.coreKind == ContentKind.assessment) {
                    showModalBS(
                      context: context,
                      body: AttemptsBottomSheet(
                        enrollment: presenter.enrollment,
                        content: content,
                        presenter: Alligator().call<AttemptsPresenter>(),
                      ),
                    );
                  }
                },
                onMarkAsCompleted: (content) {
                  presenter.toggleCompleted(content);
                },
                selectedContent: presenter.selectedContent,
              );
            }
            return const EmptyWidget();
          },
        ),
        const SpacingVertical.spacing16(),
      ],
    );
  }
}
