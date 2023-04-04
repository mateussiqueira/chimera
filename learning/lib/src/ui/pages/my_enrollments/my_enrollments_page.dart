import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'my_enrollments_presenter.dart';
import 'widgets/widgets.dart';

class MyEnrollmentsPage extends StatelessWidget {
  const MyEnrollmentsPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final MyEnrollmentsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    double padding =
        ResponsiveLayoutWidget.isTablet(context) ? Sizes.size32 : Sizes.size16;
    return ScaffoldBaseWidget(
      appBar: PrimaryAppBarWidget(
        title: R.string.myCourses,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: ListenableBuilder(
          listenable: presenter,
          builder: (context) {
            final userHasConnection = presenter.hasConnection;
            if (userHasConnection != null && !userHasConnection) {
              return const EnrollmentsNoConnectionWidget();
            }
            final userIsLoggedIn = presenter.isLoggedIn;
            if (userIsLoggedIn != null) {
              if (userIsLoggedIn) {
                return EnrollmentsListWidget(
                    presenter: presenter, padding: padding);
              }
              return EnrollmentsNoAuthenticationWidget(presenter: presenter);
            }
            return const EmptyWidget();
          },
        ),
      ),
    );
  }
}
