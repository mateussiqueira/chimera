import 'package:dependencies/dependencies.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';

class LoadEnrollmentRatingsSpy extends Mock implements LoadEnrollmentRatings {
  When mockLoadCall() => when(() => load(params: any(named: 'params')));

  void mockLoad(List<RemoteRatingModel>? future) =>
      mockLoadCall().thenAnswer((_) async => future);

  void mockLoadError(dynamic error) => mockLoadCall().thenThrow(error);
}
