import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart' as p;

void main() {
  late PackageInfoAdapter sut;
  late String appName;
  late String packageName;
  late String version;
  late String versionDebug;
  late String buildNumber;

  setUp(() {
    appName = faker.randomGenerator.string(25);
    packageName = faker.internet.domainName();
    version = '1.0.2';
    versionDebug = '$version-DEBUG';
    buildNumber = '55';

    p.PackageInfo.setMockInitialValues(
      appName: appName,
      packageName: packageName,
      version: versionDebug,
      buildNumber: buildNumber,
      buildSignature: '',
      installerStore: '',
    );
    sut = PackageInfoAdapter();
  });

  test('Should return a app version description', () async {
    final retrievedVersion = await sut.appVersionDescription();

    expect(retrievedVersion, versionDebug);
  });

  test('Should return a absolute app version', () async {
    final retrievedVersion = await sut.absoluteAppVersion();

    expect(retrievedVersion, version);
  });
}
