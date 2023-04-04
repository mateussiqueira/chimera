import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../product_presenter.dart';

class ProductContentWidget extends StatelessWidget {
  const ProductContentWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final ProductPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        final nodes = presenter.product?.productable?.tree?.nodes;

        if (nodes != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            child: Column(
              children: [
                SectionHeaderWidget(
                  title: R.string.seeCourseContent,
                ),
                const SpacingVertical.spacing16(),
                NodesGeneratorWidget(
                  nodes: nodes,
                  onClickContent: (ContentEntity content) {},
                  onMarkAsCompleted: (content) {},
                  selectedContent: null,
                  showMarkButton: false,
                ),
                const SpacingVertical.spacing40(),
              ],
            ),
          );
        }
        return const EmptyWidget();
      },
    );
  }
}
