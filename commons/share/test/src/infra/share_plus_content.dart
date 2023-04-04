import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final url = faker.internet.httpsUrl();

  test('Should share link successfully', () async {
    final shareContent = SharePlusContent();

    final result = shareContent.shareLink(url);

    expect(() => result, returnsNormally);
  });
}
