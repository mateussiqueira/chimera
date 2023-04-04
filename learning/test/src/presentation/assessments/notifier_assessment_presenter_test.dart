import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/presentation/presentation.dart';

import '../../mocks/mocks.dart';

void main() {
  late NotifierAssessmentPresenter sut;

  late LoadAttemptSpy loadAttempt;
  late CompleteAttemptSpy completeAttempt;
  late UpdateAttemptSpy updateAttempt;

  AssessmentAttemptEntity assessmentAttempt = AssessmentAttemptEntity(
    id: faker.guid.guid(),
    assessmentId: faker.guid.guid(),
    status: AttemptsStatus.completed,
    score: faker.randomGenerator.integer(100),
    expiresAt: DateTime.now(),
    questions: [
      QuestionEntity(
          id: faker.guid.guid(),
          feedback: faker.guid.guid(),
          alternativeId: faker.guid.guid(),
          statement: faker.guid.guid(),
          status: AssessmentAnswerStatus.correct,
          alternatives: [
            AlternativeEntity(
                id: faker.guid.guid(), statement: faker.guid.guid())
          ])
    ],
    answers: [
      AnswerEntity(
          questionId: faker.guid.guid(), alternativeId: faker.guid.guid())
    ],
  );

  setUp(() {
    updateAttempt = UpdateAttemptSpy();
    loadAttempt = LoadAttemptSpy();
    completeAttempt = CompleteAttemptSpy();

    sut = NotifierAssessmentPresenter(
      completeAttempt: completeAttempt,
      loadAttempt: loadAttempt,
      updateAttempt: updateAttempt,
    );

    updateAttempt.mockUpdate();
    loadAttempt.mockLoad(attempt: assessmentAttempt);
    completeAttempt.mockComplete(attempt: assessmentAttempt);
  });
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(const RemoteLoadEnrollmentsParams());
  });

  test('Should notify listeners on Send success', () async {
    final result = await sut.send();

    expect(result, true);
  });

  test('Should emits error events on GenericError', () async {
    completeAttempt.mockCompleteError(Exception());

    await sut.send();
    expect(sut.currentError, Errors.generic);
  });
  test('Should emits error events on NoInternet', () async {
    completeAttempt.mockCompleteError(NoInternetError());

    await sut.send();
    expect(sut.currentError, Errors.noInternet);
  });

  test('Should call VisualizeAttemptSent emits error events on GenericError',
      () async {
    loadAttempt.mockLoadError(Exception());

    await sut.visualizeAttemptSent();
    expect(sut.currentError, Errors.generic);
  });
  test('Should call VisualizeAttemptSent emits error events on NoInternet',
      () async {
    loadAttempt.mockLoadError(NoInternetError());

    await sut.visualizeAttemptSent();
    expect(sut.currentError, Errors.noInternet);
  });
}
