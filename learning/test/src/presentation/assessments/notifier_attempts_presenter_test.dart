import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/presentation/presentation.dart';

import '../../mocks/mocks.dart';

void main() {
  late NotifierAttemptsPresenter sut;
  late LoadAttemptSpy loadAttempt;
  late AddAttemptSpy addAttempt;

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
    loadAttempt = LoadAttemptSpy();
    addAttempt = AddAttemptSpy();
    sut = NotifierAttemptsPresenter(
      loadAttempt: loadAttempt,
      addAttempt: addAttempt,
    );
    sut.init(
        const EnrollmentEntity(course: CourseEntity()), const ContentEntity());

    addAttempt.mockAdd(attempt: assessmentAttempt);
    loadAttempt.mockLoad(attempt: assessmentAttempt);
  });
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(AddAttemptParams(id: faker.guid.guid()));
  });

  group('visualizeAttempt', () {
    test('Should call visualizeAttempt return correct values', () async {
      final future = await sut.visualizeAttempt(0);
      expect(future, assessmentAttempt);
    });
    test('Should emits error events on GenericError', () async {
      loadAttempt.mockLoadError(Exception());

      await sut.visualizeAttempt(0);
      expect(sut.currentError, Errors.generic);
    });
    test('Should emits error events on NoInternet', () async {
      loadAttempt.mockLoadError(NoInternetError());

      await sut.visualizeAttempt(0);
      expect(sut.currentError, Errors.noInternet);
    });
  });
  group('createAttempt', () {
    test('Should call createAttempt return correct values', () async {
      final future = await sut.createAttempt();
      expect(future, assessmentAttempt);
    });
    test('Should emits error events on GenericError', () async {
      addAttempt.mockAddError(Exception());

      await sut.createAttempt();
      expect(sut.currentError, Errors.generic);
    });
    test('Should emits error events on NoInternet', () async {
      addAttempt.mockAddError(NoInternetError());

      await sut.createAttempt();
      expect(sut.currentError, Errors.noInternet);
    });
  });
}
