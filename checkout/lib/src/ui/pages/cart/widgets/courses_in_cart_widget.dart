import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/discovery.dart';

import 'widgets.dart';

class CoursesInCartWidget extends StatelessWidget {
  const CoursesInCartWidget({
    super.key,
    required this.courses,
    required this.delete,
  });

  final List<OffersEntity>? courses;
  final Future Function({required String? offerId}) delete;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CourseCardWidget(
        course: courses?.getOrNull(index),
        delete: delete,
      ),
      separatorBuilder: (ctx, index) {
        return Column(
          children: const [
            SpacingVertical.spacing16(),
            HorizontalDividerWidget(
              style: HorizontalDividerStyle.light,
            ),
            SpacingVertical.spacing16(),
          ],
        );
      },
      itemCount: courses?.length ?? 0,
    );
  }
}
