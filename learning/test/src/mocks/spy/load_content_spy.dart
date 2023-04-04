import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class LoadContentUseCaseSpy extends Mock implements LoadContentUseCase {
  When mockLoadCall() => when(() => load(
        enrollmentId: any(named: 'enrollmentId'),
        contentId: any(named: 'contentId'),
      ));

  void mockLoad(ContentEntity content) =>
      mockLoadCall().thenAnswer((_) async => content);

  void mockLoadError(dynamic error) => mockLoadCall().thenThrow(error);
}
