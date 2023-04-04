import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';

import '../mocks.dart';

@visibleForTesting
class LoadEnrollmentsSpy extends Mock implements LoadEnrollmentsUseCase {
  final _enrollments = RemoteEnrollmentModel.fromJsonList(
      mockEnrollmentsValidData, const PaginationEntity(page: 1, perPage: 10));

  When mockLoadCall() => when(() => load(params: any(named: 'params')));

  void mockLoad() => mockLoadCall().thenAnswer((_) async => _enrollments);

  void mockLoadError(dynamic error) =>
      when(() => mockLoadCall().thenThrow(error));
}
