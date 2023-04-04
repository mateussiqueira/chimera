import 'package:certificates/certificates.dart';
import 'package:courses/courses.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';

abstract class CoursePresenter extends UpdatePresenter {
  Future<void> load(EnrollmentEntity enrollment);
  Future<void> reload();
  void selectContent(ContentEntity content);
  Future<void> toggleCompleted(ContentEntity content);

  Future<void> loadingRating();
  Future<bool> saveRating(int score);
  int? get score;

  bool hasCertificate();
  bool get courseCompleted;

  int get totalLessons;
  int get totalDoneLessons;

  EnrollmentEntity? get enrollment;
  CourseEntity? get course;
  ContentEntity? get selectedContent;
  CertificateEntity? get certificate;

  double get coursePercentage;
  int get minPassPercentage;
  DateTime? get expirationDate;
  List<String>? get goals;
  int? get durationInHours;
  String? get categoryName;
  DateTime get lastActivity;
}
