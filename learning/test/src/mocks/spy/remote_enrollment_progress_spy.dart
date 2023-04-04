import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class RemoveEnrollmentProgressSpy extends Mock
    implements RemoveEnrollmentProgress {
  When mockRemoveCall() => when(() => remove(
        enrollmentId: any(named: 'enrollmentId'),
        contentId: any(named: 'contentId'),
      ));

  void mockRemove() => mockRemoveCall().thenAnswer((_) async => _);

  void mockRemoveError(dynamic error) => mockRemoveCall().thenThrow(error);
}
