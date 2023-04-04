import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/pages/assessment/after_send_action.dart';
import 'package:learning/src/ui/pages/assessment/assessment_presenter.dart';
import 'package:learning/src/ui/pages/assessment/widgets/alternative_widget.dart';
import 'package:learning/src/ui/pages/assessment/widgets/assessment_timer_widget.dart';
import 'package:learning/src/ui/pages/assessment/widgets/bottom_sheets/bottom_sheets.dart';
import 'package:learning/src/ui/pages/assessment/widgets/question_navigation_widget.dart';

import '../../styles/learning_module_style.dart';

class AssessmentPage extends StatelessWidget with UIBottomSheetMixin {
  AssessmentPage({
    Key? key,
    required this.presenter,
    AssessmentPageArgumentsEntity? arguments,
  }) : super(key: key) {
    presenter.init(
      arguments: arguments,
    );
  }

  final AssessmentPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: SecondaryAppBarWidget(
        title: presenter.pageTitle(),
      ),
      body: GestureDetector(
        onTap: () => presenter.setOpen(false),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListenableBuilder(
                      listenable: presenter,
                      builder: (context) => timerWidget(context),
                    ),
                    ListenableBuilder(
                      listenable: presenter,
                      builder: (context) => presenter.isVisualizationOnly()
                          ? questionStatusWidget(context)
                          : const EmptyWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Sizes.size16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ListenableBuilder(
                                listenable: presenter,
                                builder: (context) => TextWidget.displayXxlBold(
                                  text: questionPositionText(),
                                  style: moduleStyle.tertiary
                                      .textModuleStyleWithPrimaryColor(context),
                                ),
                              ),
                              const SpacingHorizontal.spacing08(),
                              TextWidget.textSmNormal(
                                text: R.string.of(presenter.getTotal()),
                                style: moduleStyle.primary
                                    .textModuleStyleWithSecondaryColor(context),
                              ),
                              const Spacer(),
                              BadgeWidget(
                                backgroundColor: moduleStyle.tertiary
                                    .backgroundModulePrimaryColor(context),
                                child: TextWidget.textXsMedium(
                                  text: R.string.attempt(
                                    presenter.attemptNumber(),
                                    presenter.maxAttempts(),
                                  ),
                                  style: moduleStyle.tertiary
                                      .textModuleStyleWithTertiaryColor(
                                          context),
                                ),
                              ),
                            ],
                          ),
                          const SpacingVertical.spacing12(),
                          ListenableBuilder(
                            listenable: presenter,
                            builder: (context) => HtmlRenderWidget(
                              html: getStatementHtml(
                                presenter.getCurrentStatement(),
                              ),
                            ),
                          ),
                          const SpacingVertical.spacing20(),
                          ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) => ListenableBuilder(
                              listenable: presenter,
                              builder: (context) => AlternativeWidget(
                                letter: presenter
                                    .getCurrentAlternativeLetter(index),
                                onPressed: () =>
                                    presenter.selectAlternative(index),
                                statement: presenter
                                    .getCurentAlternativeStatement(index),
                                status: presenter
                                    .getCurrentAlternativeStatus(index),
                              ),
                            ),
                            separatorBuilder: (context, _) =>
                                const SpacingVertical.spacing08(),
                            itemCount: presenter.getCurrentAlternativesLenght(),
                          ),
                          if (presenter.shouldShowCommentedFeedback()) ...[
                            const SpacingVertical.spacing20(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () => seeCommentedFedback(context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icons.fileAttachment05.iconCopyWith(
                                      color: moduleStyle.primary
                                          .textModulePrimaryColor(context),
                                      size: Sizes.size20,
                                    ),
                                    const SpacingHorizontal.spacing04(),
                                    TextWidget.textSmMedium(
                                      text: R.string.seeCommentedFeedback,
                                      style: moduleStyle.primary
                                          .textModuleStyleWithPrimaryColor(
                                              context),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacings.spacing16,
                vertical: Spacings.spacing08,
              ),
              child: ListenableBuilder(
                listenable: presenter,
                builder: (context) => QuestionNavigationWidget(
                  presenter: presenter,
                  send: () async => showSendBottomSheet(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String questionPositionText() {
    int position = presenter.currentIndex() + 1;
    return position < 10 ? "0$position" : "$position";
  }

  Widget timerWidget(BuildContext context) {
    if (presenter.startSecondsRemaining() <= 0 &&
        !presenter.isVisualizationOnly()) {
      Future.microtask(() => showOnTimesOverBottomSheet(context));
    }
    return !presenter.isVisualizationOnly()
        ? AssessmentTimerWidget(
            remainingSeconds: presenter.startSecondsRemaining(),
          )
        : const EmptyWidget();
  }

  Widget questionStatusWidget(BuildContext context) {
    bool? hit = presenter.questionHit();
    return hit == null
        ? const EmptyWidget()
        : Container(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size08, horizontal: Sizes.size16),
            color: hit
                ? moduleStyle.success.backgroundModulePrimaryColor(context)
                : moduleStyle.danger.backgroundModulePrimaryColor(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextWidget.textSmNormal(
                    text: hit
                        ? R.string.congratsYouHitTheQuestion
                        : R.string.tooBadTheAnswerIsIncorrect,
                    style: TextStyle(
                      color: questionStatusTextColor(hit, context),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Color? questionStatusTextColor(bool? hit, BuildContext context) {
    return hit == true
        ? moduleStyle.success.textModulePrimaryColor(context)
        : moduleStyle.danger.textModulePrimaryColor(context);
  }

  String getStatementHtml(String content) {
    return '''<div style="font-family: 'Inter'; font-style: normal; font-weight: 400; font-size: 16px; line-height: 24px; color: #344054;">$content</div>''';
  }

  void seeCommentedFedback(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/learning/assessment/commentedFeedback',
      arguments: {
        'comment': presenter.commentedFeedback(),
      },
    );
  }

  Future<void> showOnTimesOverBottomSheet(BuildContext context) async {
    var result = await showModalBS<bool>(
      context: context,
      body: const AttemptsOverBottomSheet(),
    );
    if (result == true) {
      Route66.pop();
    } else {
      await presenter.visualizeAttemptSent();
    }
  }

  Future<void> showSendBottomSheet(BuildContext context) async {
    var sendBsResult = await showModalBS<bool>(
      context: context,
      body: const SendAttemptBottomSheet(),
    );
    if (sendBsResult == true) {
      if (!presenter.shouldSend()) {
        var attentionBsResult = await showModalBS<bool>(
          context: context,
          body: const SendAttemptAttentionBottomSheet(),
        );
        if (attentionBsResult == true) {
          await send(context: context);
        }
      } else {
        await send(context: context);
      }
    }
  }

  Future<void> send({required BuildContext context}) async {
    bool result = await presenter.send();
    if (result) {
      navigateToSuccessPage(context: context);
    }
  }

  Future<void> navigateToSuccessPage({required BuildContext context}) async {
    final result = await Route66.pushNamed(
      '/learning/assessment/sent',
      arguments: {
        'attemptId': presenter.attemptId,
        'assessmentId': presenter.assessmentId,
        'enrollmentId': presenter.enrollmentId,
      },
    );

    if (result is AfterSendAction?) {
      switch (result) {
        case AfterSendAction.tryAgain:
          Route66.pop(result: result);
          break;
        case AfterSendAction.backToCourses:
          Route66.pop();
          break;
        case AfterSendAction.viewAttempt:
          presenter.visualizeAttemptSent();
          break;
        default:
          Route66.pop();
          break;
      }
    }
  }
}
