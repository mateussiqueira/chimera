import 'package:courses/courses.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';

abstract class ContentPresenter extends UpdatePresenter {
  Future<void> init(EnrollmentEntity enrollment, ContentEntity content);
  Future<void> load(ContentEntity content);
  Future<void> toggleCompleted(ContentEntity content);
  Future<void> back();
  Future<void> forward();

  ContentEntity? get content;

  bool get canGoBack;
  bool get canGoForward;
  bool get isLoading;
}
