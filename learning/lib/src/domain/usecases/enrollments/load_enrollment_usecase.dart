import 'package:learning/src/domain/domain.dart';

abstract class LoadEnrollmentUseCase {
  Future<EnrollmentEntity> load({required String id});
}
