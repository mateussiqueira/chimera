import 'package:certificates/certificates.dart';
import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/learning_module.dart';
import 'package:learning/src/ui/pages/course/course.dart';
import 'package:learning/src/ui/pages/course/widgets/about/row_icon_text_widget.dart';
import 'package:learning/src/ui/pages/my_enrollments/widgets/enrollment_expiration_style.dart';

import '../../../styles/learning_module_style.dart';
import 'about/about.dart';

class AboutCourseTab extends StatelessWidget with UIBottomSheetMixin {
  const AboutCourseTab({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final CoursePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _banner,
          const SpacingVertical.spacing16(),
          _content(context),
          const SpacingVertical.spacing16(),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Sizes.sizeInfinity,
            child: TextWidget.displayXxlBold(
              text: presenter.course?.name ?? '',
              textAlign: TextAlign.center,
              style: moduleStyle.tertiary
                  .textModuleStyleWithPrimaryColor(context)
                  ?.copyWith(
                    height: 1.2,
                  ),
            ),
          ),
          const SpacingVertical.spacing12(),
          _infoCourseDuration(context),
          littleVerticalSpacing,
          CourseProgressWidget(
            presenter: presenter,
          ),
          if (!_isCourseFinished()) ...[
            littleVerticalSpacing,
            SectionHeaderWidget(
              title: R.string.howToIssueYourCertificate,
            ),
            const SpacingVertical.spacing12(),
            ListDotWidget(text: R.string.finishAllLessons),
            const SpacingVertical.spacing16(),
            ListDotWidget(
              text: R.string
                  .minimumOfInAllAssessments(presenter.minPassPercentage),
            ),
          ],
          if (presenter.goals?.isNotEmpty == true) ...[
            littleVerticalSpacing,
            ListenableBuilder(
              listenable: presenter,
              builder: (context) {
                return ProductGoalsWidget(
                  presenter: presenter,
                  goals: presenter.goals,
                );
              },
            ),
          ],
          if (!_isCourseFinished()) ...[
            littleVerticalSpacing,
            ListenableBuilder(
              listenable: presenter,
              builder: (context) {
                return ProductExpectationsWidget(
                  presenter: presenter,
                  durationInHours: presenter.durationInHours,
                );
              },
            ),
          ]
        ],
      ),
    );
  }

  Widget get littleVerticalSpacing {
    return ResponsiveLayoutWidget(
      mobile: (context) => const SpacingVertical.spacing24(),
      tablet: (context) => const SpacingVertical.spacing32(),
    );
  }

  Widget _infoCourseDuration(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RowIconTextWidget(
          icon: Icons.clock,
          text: R.string.courseWorkTime(
            presenter.course?.durationInHours ?? 0,
          ),
        ),
        const SpacingVertical.spacing08(),
        RowIconTextWidget(
          icon: Icons.calendar,
          text: R.string.accessUntil(
            presenter.expirationDate ?? DateTime.now(),
          ),
        ),
      ],
    );
  }

  Widget get _banner {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) => Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              courseImage(context),
              _courseCategoryBadge(context),
              certificateContainer(context),
            ],
          ),
          RateCourseWidget(
            isCourseFinished: _isCourseFinished(),
            score: presenter.score,
            onStarPressed: (score) => rateCourse(score, context),
          ),
        ],
      ),
    );
  }

  Widget _courseCategoryBadge(BuildContext context) {
    final categoryName = presenter.categoryName;
    if (presenter.hasCertificate() || categoryName == null) {
      return const EmptyWidget();
    }
    final resolvedStyle = context.resolveStyle<EnrollmentExpirationStyle>();
    return Positioned(
      top: Sizes.size16,
      left: Sizes.size16,
      child: BadgeWidget(
        backgroundColor: resolvedStyle?.backgroundColor ??
            moduleStyle.tertiary.backgroundModulePrimaryColor(context),
        child: ListenableBuilder(
          listenable: presenter,
          builder: (context) => TextWidget.textSmMedium(
            text: categoryName,
            style: TextStyle(
              color: resolvedStyle?.textColor ??
                  moduleStyle.tertiary.textModulePrimaryColor(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget certificateContainer(BuildContext context) {
    return !presenter.hasCertificate()
        ? const EmptyWidget()
        : Container(
            width: double.infinity,
            height: imageHeight(context),
            color: Colors.black.withOpacity(0.8),
            child: Center(
              child: TextButtonWidget(
                onPressed: () => downloadCertificate(context),
                child: TextWidget.textSmMedium(
                  text: R.string.downloadCertificate,
                  style: moduleStyle.secondary
                      .textModuleStyleWithSecondaryColor(context),
                ),
              ),
            ),
          );
  }

  Future<void> downloadCertificate(BuildContext context) async {
    if (!presenter.hasCertificate()) {
      return;
    }
    await showModalBS<bool>(
      context: context,
      body: DownloadCertificateBottomSheet(
        presenter: LearningModule.alligator.get<DownloadCertificatePresenter>(),
        certificate: presenter.certificate!,
      ),
    );
  }

  bool _isCourseFinished() => presenter.coursePercentage == 1;

  Future<void> rateCourse(int score, BuildContext context) async {
    bool result = await presenter.saveRating(score);
    if (result) {
      showSaveRatingToast(context: context);
    }
  }

  void showSaveRatingToast({required BuildContext context}) {
    ToastWidget.show(
      message: R.string.rateSuccessMessage,
      icon: Icons.checkCircle.iconCopyWith(
          color: moduleStyle.secondary.textModuleQuaternaryColor(context)),
      toastType: ToastType.success,
    );
  }

  Widget courseImage(BuildContext context) {
    if (courseImageUrl != null) {
      return Container(
        height: imageHeight(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.dstATop,
            ),
            image: NetworkImageProvider(courseImageUrl!),
          ),
          color: Colors.black,
        ),
      );
    }
    return SizedBox(
      height: imageHeight(context),
      width: double.infinity,
      child: const ImageWidget(
        image: Images.videoPlaceholder,
        fit: BoxFit.cover,
      ),
    );
  }

  double imageHeight(BuildContext context) =>
      ResponsiveLayoutWidget.isTablet(context) ? 305 : 190;

  MediaEntity? get courseMedia => presenter.course?.media;
  String? get courseImageUrl =>
      courseMedia?.headerImage ?? courseMedia?.cardImage;
}
