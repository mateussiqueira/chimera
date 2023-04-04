import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart' as p;

import '../domain/domain.dart';

class PackageInfoAdapter implements PackageInfo {
  @override
  Future<String> appVersionDescription() async {
    try {
      final packageInfo = await p.PackageInfo.fromPlatform();
      return packageInfo.version;
    } catch (error) {
      return "";
    }
  }

  @override
  Future<String> absoluteAppVersion({String? separator}) async {
    try {
      final packageInfo = await p.PackageInfo.fromPlatform();
      var version = packageInfo.version;
      if (kDebugMode) {
        version = version.replaceAll('-DEBUG', '');
      }
      if (separator != null) {
        version = version.replaceAll('.', separator);
      }
      return version;
    } catch (error) {
      return "";
    }
  }
}
