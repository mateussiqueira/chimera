import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/pages/my_enrollments/my_enrollments.dart';

class NotifierMyEnrollmentsPresenter extends ChangeNotifier
    with LoadingMixin, HandleErrorMixin
    implements MyEnrollmentsPresenter {
  NotifierMyEnrollmentsPresenter({
    required this.remoteLoadEnrollments,
    required this.localUserIsLoggedIn,
    required this.networkConnection,
  }) {
    Marcopolo().listener().onData((event) {
      if (event is UserLoggedInEvent || event is UserLoggedOffEvent) {
        verifyUserAccount();
      }
    });
    verifyUserConnection();
  }

  final LoadEnrollmentsUseCase remoteLoadEnrollments;
  final UserIsLoggedIn localUserIsLoggedIn;
  final NetworkConnection networkConnection;

  List<EnrollmentEntity> _enrollments = [];
  bool? _isLoggedIn;
  bool? _hasConnection;
  RemoteLoadEnrollmentsParams _params = const RemoteLoadEnrollmentsParams();
  PaginationEntity? _pagination;

  void _update() {
    notifyListeners();
  }

  @override
  List<EnrollmentEntity> get enrollments => _enrollments;

  @override
  bool? get isLoggedIn => _isLoggedIn;

  @override
  bool? get hasConnection => _hasConnection;

  @override
  Future<void> load() async {
    showLoading();
    try {
      final enrollments = await remoteLoadEnrollments.load(
        params: _params,
      );
      _enrollments = [
        ..._enrollments,
        ...enrollments.data,
      ];
      _pagination = enrollments.pagination;

      _update();
    } on DomainError catch (error) {
      handleError(Errors.error, error);
    } on NoInternetError catch (_) {
      handleError(Errors.noInternet, null);
    } on Exception catch (_) {
      handleError(Errors.generic, null);
    }
    hideLoading();
  }

  @override
  Future<void> nextPage() async {
    final pagination = _pagination;
    final params = _params;
    if (pagination != null) {
      if (params.page < (pagination.totalPages ?? 0)) {
        _params = params.copyWith(page: _params.page + 1);
        await load();
      }
    }
  }

  @override
  Future<void> verifyUserAccount() async {
    try {
      final loggedIn = await localUserIsLoggedIn.verify();
      if (loggedIn) {
        await load();
      }
      _isLoggedIn = loggedIn;
      _update();
    } catch (_) {}
  }

  Future<void> verifyUserConnection() async {
    try {
      final connection = await networkConnection.hasNetwork();

      _hasConnection = connection;
      if (connection) {
        verifyUserAccount();
      }
      _update();
      _setupConnectionListener();
    } catch (_) {}
  }

  void _setupConnectionListener() {
    networkConnection.connectionStream.listen((NetworkStatus status) {
      _hasConnection = status != NetworkStatus.disconnected;
      if (isLoggedIn == null) {
        verifyUserAccount();
      }
      _update();
    });
  }
}
