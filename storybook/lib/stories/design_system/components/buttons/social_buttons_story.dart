import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SocialButtonStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Buttons/Social Buttons';

  @override
  String? get description => 'Social Network Buttons';

  @override
  Widget buildStory(BuildContext context) {
    final enabled = context.knobs.boolean(
      label: 'Enabled',
      initial: true,
    );
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ..._facebook(enabled, context),
            const SpacingVertical.spacing32(),
            ..._apple(enabled, context),
            const SpacingVertical.spacing32(),
            ..._google(enabled, context),
          ],
        ),
      ),
    );
  }

  List<Widget> _facebook(bool enabled, BuildContext context) {
    return [
      Text(
        'Facebook Buttons',
        style: TypographyDisplayXxl.medium(context),
      ),
      const SpacingVertical.spacing16(),
      FacebookSignInButton(
        onPressed: enabled ? () {} : null,
      ),
      const SpacingVertical.spacing08(),
      FacebookSignInButton.icon(
        onPressed: enabled ? () {} : null,
      ),
    ];
  }

  List<Widget> _apple(bool enabled, BuildContext context) {
    return [
      Text(
        'Apple Buttons',
        style: TypographyDisplayXxl.medium(context),
      ),
      const SpacingVertical.spacing16(),
      AppleSignInButton(
        onPressed: enabled ? () {} : null,
      ),
      const SpacingVertical.spacing08(),
      AppleSignInButton.icon(
        onPressed: enabled ? () {} : null,
      ),
    ];
  }

  List<Widget> _google(bool enabled, BuildContext context) {
    return [
      Text(
        'Google Buttons',
        style: TypographyDisplayXxl.medium(context),
      ),
      const SpacingVertical.spacing16(),
      GoogleSignInButton(
        onPressed: enabled ? () {} : null,
      ),
      const SpacingVertical.spacing08(),
      GoogleSignInButton.icon(
        onPressed: enabled ? () {} : null,
      ),
    ];
  }
}
