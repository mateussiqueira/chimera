import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';

import '../my_enrollments_presenter.dart';
import 'enrollment_card_widget.dart';
import 'enrollments_empty_widget.dart';

class EnrollmentsListWidget extends StatelessWidget {
  const EnrollmentsListWidget({
    Key? key,
    required this.presenter,
    this.padding = Sizes.size00,
  }) : super(key: key);

  final MyEnrollmentsPresenter presenter;
  final crossAxisSpacing = Sizes.size16;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        if (presenter.enrollments.isEmpty) {
          return const EnrollmentsEmptyWidget();
        }
        return ResponsiveLayoutWidget(
          mobile: (context) => items(1, context),
          tablet: (context) => items(2, context),
        );
      },
    );
  }

  Widget items(int columns, BuildContext context) {
    if (presenter.enrollments.length == 1 && columns == 2) {
      final enrollment = presenter.enrollments[0];
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: enrollmentButton(enrollment),
            ),
          ),
        ],
      );
    }
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: contentWidth(context, columns),
        child: PaginationGridWidget(
          shrinkWrap: true,
          itemCount: presenter.enrollments.length,
          mainAxisSpacing: crossAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          nextPage: presenter.nextPage,
          crossAxisCount: columns,
          itemBuilder: (context, index) {
            final enrollment = presenter.enrollments[index];
            return enrollmentButton(enrollment);
          },
        ),
      ),
    );
  }

  Widget enrollmentButton(EnrollmentEntity enrollment) {
    return GestureDetector(
      child: EnrollmentCardWidget(
        enrollment: enrollment,
      ),
      onTap: () {
        Route66.pushNamed(
          '/learning/course',
          arguments: enrollment,
        );
      },
    );
  }

  double? contentWidth(BuildContext context, int columns) {
    if (columns == 1) return null;
    const columnWidth = 475.0;
    final screenSpace = MediaQuery.of(context).size.width - 2 * padding;
    final contentSpace =
        (columnWidth * columns - ((columns - 1) * crossAxisSpacing)) -
            2 * padding;
    if (screenSpace > contentSpace) return contentSpace;
    return null;
  }
}
