import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';

abstract class MyEnrollmentsPresenter implements Listenable {
  Future<void> showLoading();
  Future<void> hideLoading();

  void handleError(Errors error, dynamic exception);
  Errors? get currentError;

  Future<void> load();
  Future<void> verifyUserAccount();
  Future<void> nextPage();

  List<EnrollmentEntity> get enrollments;
  bool? get isLoggedIn;
  bool? get hasConnection;
}
