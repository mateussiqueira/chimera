import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/pages/pages.dart';

import '../../styles/learning_module_style.dart';
import 'widgets/widgets.dart';

class CoursePage extends StatelessWidget {
  CoursePage({
    Key? key,
    required this.presenter,
    required EnrollmentEntity enrollment,
  }) : super(key: key) {
    presenter.load(enrollment);
  }

  final CoursePresenter presenter;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        return DefaultTabController(
          length: 2,
          child: ScaffoldBaseWidget(
            appBar: SecondaryAppBarWidget(
              title: presenter.course?.name ?? '',
            ),
            body: NestedScrollView(
              controller: scrollController,
              floatHeaderSlivers: true,
              physics: const BouncingScrollPhysics(),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CourseContentTab(
                    scrollController: scrollController,
                    presenter: presenter,
                  ),
                  AboutCourseTab(
                    presenter: presenter,
                  ),
                ],
              ),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    pinned: false,
                    primary: false,
                    automaticallyImplyLeading: false,
                    backgroundColor: moduleStyle.primary
                        .backgroundModulePrimaryColor(context),
                    title: TabBarWidget(
                      tabs: [
                        Tab(
                          child:
                              TextWidget.displayMdBold(text: R.string.content),
                        ),
                        Tab(
                          child: TextWidget.displayMdBold(
                              text: R.string.aboutCourse),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),
        );
      },
    );
  }
}
