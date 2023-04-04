import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class SaveEnrollmentProgressSpy extends Mock implements SaveEnrollmentProgress {
  When mockSaveCall() => when(() => save(
        enrollmentId: any(named: 'enrollmentId'),
        contentId: any(named: 'contentId'),
      ));

  void mockSave() => mockSaveCall().thenAnswer((_) async => _);

  void mockSaveError(dynamic error) => mockSaveCall().thenThrow(error);
}
