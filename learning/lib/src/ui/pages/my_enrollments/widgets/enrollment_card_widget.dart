import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';

import 'enrollment_expiration_widget.dart';

class EnrollmentCardWidget extends StatelessWidget {
  const EnrollmentCardWidget({
    Key? key,
    required this.enrollment,
  }) : super(key: key);

  final EnrollmentEntity enrollment;
  final maxLines = 2;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      style: CardStyle.light.copyWith(
        padding: EdgeInsets.zero,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(Sizes.size16),
            ),
            child: courseImageUrl != null
                ? NetworkImageWidget(
                    url: courseImageUrl,
                    fit: BoxFit.cover,
                    height: 83,
                    width: double.infinity,
                  )
                : const SizedBox(
                    height: 83,
                    width: double.infinity,
                    child: ImageWidget(
                      image: Images.videoPlaceholder,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Sizes.size16,
              Sizes.size00,
              Sizes.size16,
              Sizes.size12,
            ),
            child: Column(
              children: [
                const SpacingVertical.spacing16(),
                ResponsiveLayoutWidget(
                  mobile: (context) => Center(
                    child: courseName(context),
                  ),
                  tablet: (context) => SizedBox(
                    height: TextWidget.lineHeight(
                            style: TypographyDisplayLg.bold(context),
                            context: context) *
                        maxLines,
                    child: Center(
                      child: courseName(context),
                    ),
                  ),
                ),
                const SpacingVertical.spacing16(),
                LinearProgressBarWidget(
                  progress: percentage / 100,
                ),
                const SpacingVertical.spacing16(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextWidget.textSmNormal(
                        text: R.string.percentageFinished(percentage),
                        style: primaryModuleStyle
                            .textModuleStyleWithSecondaryColor(context),
                      ),
                    ),
                    if (enrollment.expireAt != null) ...[
                      const SpacingHorizontal.spacing08(),
                      EnrollmentExpirationWidget(
                        expireDate: enrollment.expireAt!,
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget courseName(BuildContext context) {
    return TextWidget.displayLgBold(
      text: enrollment.course.name ?? '',
      style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
      textAlign: TextAlign.center,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  int get percentage => enrollment.progressPercentage ?? 0;
  CourseEntity get course => enrollment.course;
  MediaEntity? get courseMedia => course.media;
  String? get courseImageUrl {
    return courseMedia?.headerImage ?? courseMedia?.cardImage;
  }
}
