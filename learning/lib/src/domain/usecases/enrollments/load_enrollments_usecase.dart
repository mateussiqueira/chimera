import 'package:learning/src/domain/domain.dart';

abstract class LoadEnrollmentsUseCase {
  Future<EnrollmentsEntity> load({required LoadEnrollmentsParams params});
}
