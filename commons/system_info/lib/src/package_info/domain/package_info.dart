abstract class PackageInfo {
  Future<String> appVersionDescription();
  Future<String> absoluteAppVersion({String? separator});
}
