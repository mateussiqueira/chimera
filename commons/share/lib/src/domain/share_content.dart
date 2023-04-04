import 'dart:typed_data';

abstract class ShareContent {
  Future<void> shareLink(String url);
  Future<void> shareBytes(Uint8List bytes, String fileName);
}
