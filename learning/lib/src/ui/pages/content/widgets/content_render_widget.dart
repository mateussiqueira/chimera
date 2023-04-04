import 'package:courses/courses.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/content/content.dart';

import 'kinds/kinds.dart';

class ContentRenderWidget extends StatelessWidget {
  const ContentRenderWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final ContentPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        final content = presenter.content;
        final kind = content?.coreKind;
        final isLoading = presenter.isLoading;
        if (content != null && kind != null && !isLoading) {
          switch (kind) {
            case ContentKind.video:
              return ContentVideoRenderWidget(
                content: content,
                presenter: presenter,
              );
            case ContentKind.hyperText:
              return ContentHyperTextRenderWidget(content: content);
            case ContentKind.document:
              return ContentPDFRenderWidget(content: content);
            default:
              return const EmptyWidget();
          }
        }
        return const EmptyWidget();
      },
    );
  }
}
