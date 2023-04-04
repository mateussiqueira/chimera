import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class LoadEnrollmentSpy extends Mock implements LoadEnrollmentUseCase {
  When mockLoadCall() => when(() => load(id: any(named: 'id')));

  void mockLoad() => mockLoadCall()
      .thenAnswer((_) async => const EnrollmentEntity(course: CourseEntity()));

  void mockLoadError(dynamic error) => mockLoadCall().thenThrow(error);
}
