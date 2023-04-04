import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/presentation/my_enrollments/my_enrollments.dart';

import '../../mocks/mocks.dart';

void main() {
  late NotifierMyEnrollmentsPresenter sut;

  late LoadEnrollmentsSpy loadEnrollments;
  late UserIsLoggedInSpy userIsLoggedIn;
  late NetworkConnectionSpy networkConnection;

  late List<EnrollmentEntity> enrollments;

  setUp(() {
    enrollments = RemoteEnrollmentModel.fromJsonList(mockEnrollmentsValidData,
            const PaginationEntity(page: 1, perPage: 10))
        .data;

    networkConnection = NetworkConnectionSpy();
    loadEnrollments = LoadEnrollmentsSpy();
    userIsLoggedIn = UserIsLoggedInSpy();

    sut = NotifierMyEnrollmentsPresenter(
      networkConnection: networkConnection,
      localUserIsLoggedIn: userIsLoggedIn,
      remoteLoadEnrollments: loadEnrollments,
    );

    networkConnection.mockHasNetwork(true);
    userIsLoggedIn.mockVerify(true);
    loadEnrollments.mockLoad();
  });
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(const RemoteLoadEnrollmentsParams());
  });

  test('Should notify listeners on Load success', () async {
    await sut.load();

    expect(sut.enrollments, enrollments);
  });

  test('Should emits error events on NoInternet', () async {
    loadEnrollments.mockLoadError(Exception());

    await sut.load();
    expect(sut.currentError, Errors.generic);
  });
}
