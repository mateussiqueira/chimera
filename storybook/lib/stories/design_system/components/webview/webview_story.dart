import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class WebViewStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/WebView';

  @override
  String get description => 'WebView';

  @override
  Widget buildStory(BuildContext context) {
    const String token =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiNTA4ZDQ0Yy0xMWNiLTRkMmMtOWI1YS1iNGFmMjU0YjZhOTQiLCJleHAiOjE2Njk4MzQ0NjksImlzcyI6ImlibWVjLWF0bGFzLnFjYXJyZWlyYXMtaG1nLmNvbSIsImF1ZCI6ImlibWVjLWF0bGFzLnFjYXJyZWlyYXMtaG1nLmNvbSJ9.sgiwe4R4VfaosmiJ9bNXpyct97Emyh835p_eg1tyjlQ';
    const String refreshToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiNTA4ZDQ0Yy0xMWNiLTRkMmMtOWI1YS1iNGFmMjU0YjZhOTQiLCJqdGkiOiI5NjliMzExZS1hOTA2LTRlZjUtOGQxMC05MDYwNjRiYWRlNmYiLCJleHAiOjE2NzA0MzkxNDksImlzcyI6ImlibWVjLWF0bGFzLnFjYXJyZWlyYXMtaG1nLmNvbSIsImF1ZCI6ImlibWVjLWF0bGFzLnFjYXJyZWlyYXMtaG1nLmNvbSJ9.RtnvP-mo7D8aSBSLEtTTASo-A3lg6mBK143cQCgNqZI';
    return Column(
      children: [
        Text(
          'Tab Bar',
          style: TypographyDisplayXxl.medium(context),
        ),
        const Expanded(
          child: WebViewWidget(
            url:
                'https://demeter-feat-mobile-sso-olimpo-sudomf.cloud.okteto.net/api/mobile-sso?token=$token&refreshToken=$refreshToken&redirectUrl=/checkout/cartao-de-credito',
          ),
        ),
      ],
    );
  }
}
