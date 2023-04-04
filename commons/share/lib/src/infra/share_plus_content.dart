import 'dart:io';
import 'dart:typed_data';

import 'package:dependencies/dependencies.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class SharePlusContent implements ShareContent {
  @override
  Future<void> shareLink(String url) async {
    try {
      return Share.share(url);
    } catch (_) {
      throw UnexpectedError();
    }
  }

  @override
  Future<void> shareBytes(Uint8List bytes, String fileName) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = File(tempDir.path + Platform.pathSeparator + fileName);
      file.writeAsBytesSync(bytes);
      XFile xFile = XFile(file.path);
      await Share.shareXFiles([xFile]);
    } catch (_) {
      throw UnexpectedError();
    }
  }
}
