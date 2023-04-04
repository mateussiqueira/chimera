import 'package:design_system/design_system.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Icons', () {
    for (var currentIcon in Icons.values) {
      testWidgets('Should correctly render ${currentIcon.name} icon',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: currentIcon.icon,
          ),
        );
        final Finder result = find.byType(SvgPicture);
        expect(result, findsOneWidget);
      });
    }
  });
}
