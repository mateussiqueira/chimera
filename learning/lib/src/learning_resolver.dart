import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/learning_module.dart';
import 'package:learning/src/ui/pages/assessment/assessment_commented_feedback_page.dart';
import 'package:learning/src/ui/pages/assessment/assessment_send_attempt_page.dart';
import 'package:learning/src/ui/pages/assessment/widgets/bottom_sheets/attempts_bottom_sheet.dart';
import 'package:learning/src/ui/pages/pages.dart';

class LearningResolver implements MicroApp {
  @override
  String get name => '/learning/';

  final module = LearningModule.initialize();

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          name: '/learning/',
          builder: (context, args) => MyEnrollmentsPage(
            presenter: module.get<MyEnrollmentsPresenter>(),
          ),
          transitionType: TransitionType.noneTransition,
        ),
        ChildRoute(
          name: '/learning/course',
          builder: (context, args) => CoursePage(
            presenter: module.get<CoursePresenter>(),
            enrollment: args as EnrollmentEntity,
          ),
        ),
        ChildRoute(
          name: '/learning/content',
          builder: (context, args) => ContentPage(
            presenter: module.get<ContentPresenter>(),
            enrollment: (args as Map)['enrollment'],
            content: args['content'],
          ),
          transitionType: TransitionType.fadeTransition,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        ChildRoute(
          name: '/learning/attempts',
          builder: (context, args) => AttemptsBottomSheet(
            presenter: module.get<AttemptsPresenter>(),
            enrollment: (args as Map)['enrollment'],
            content: args['content'],
          ),
        ),
        ChildRoute(
          name: '/learning/assessment',
          builder: (context, args) => AssessmentPage(
            presenter: module.get<AssessmentPresenter>(),
            arguments: (args as Map)['arguments'],
          ),
        ),
        ChildRoute(
          name: '/learning/assessment/commentedFeedback',
          builder: (context, args) => AssessmentCommentedFeedback(
            comment: (args as Map)['comment'],
          ),
        ),
        ChildRoute(
          name: '/learning/assessment/sent',
          builder: (context, args) => AssessmentSendAttemptPage(
            presenter: module.get<AssessmentAttemptSendPresenter>(),
            assessmentId: (args as Map)['assessmentId'],
            attemptId: args['attemptId'],
            enrollmentId: args['enrollmentId'],
          ),
        ),
      ];

  @override
  void Function(Event event) get listener => (event) {};
}
