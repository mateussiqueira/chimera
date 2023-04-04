import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class SaveEnrollmentRatingSpy extends Mock implements SaveEnrollmentRating {
  When mockSaveCall() => when(() => save(rating: any(named: 'rating')));

  void mockSave() => mockSaveCall().thenAnswer((_) async => _);

  void mockSaveError(dynamic error) => mockSaveCall().thenThrow(error);
}
