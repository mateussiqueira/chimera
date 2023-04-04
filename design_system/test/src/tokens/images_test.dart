import 'package:design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Images', () {
    for (var currentImage in Images.values) {
      testWidgets('Should correctly render ${currentImage.name} image',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: ImageWidget(
              image: currentImage,
            ),
          ),
        );
        final Finder result = find.byType(SvgPicture);
        expect(result, findsOneWidget);
      });
    }
  });
}
