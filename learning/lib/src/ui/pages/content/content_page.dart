import 'package:courses/courses.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/pages/content/content.dart';

import 'widgets/widgets.dart';

class ContentPage extends StatelessWidget {
  ContentPage({
    Key? key,
    required this.presenter,
    required EnrollmentEntity enrollment,
    required ContentEntity content,
  }) : super(key: key) {
    presenter.init(enrollment, content);
  }

  final ContentPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: ContentAppBarWidget(
        context: context,
        presenter: presenter,
      ),
      body: NavigationToolbarWidget(
        presenter: presenter,
        child: ContentRenderWidget(
          presenter: presenter,
        ),
      ),
    );
  }
}
