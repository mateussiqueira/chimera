import 'package:courses/courses.dart';

abstract class LoadContentUseCase {
  Future<ContentEntity> load({
    required String enrollmentId,
    required String contentId,
  });
}
