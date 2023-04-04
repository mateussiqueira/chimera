import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LinkButtonStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Buttons/Link Button';

  @override
  String? get description => 'Low emphasis button';

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
            ..._allParameters(enabled, context),
            const SpacingVertical.spacing32(),
            ..._leadingAndText(enabled, context),
            const SpacingVertical.spacing32(),
            LinkButton.sizeMd(
              foregroundColor: Colors.neutral400,
              text: 'Esqueceu sua senha?',
              onPressed: () {},
            ),
            const SpacingVertical.spacing32(),
          ],
        ),
      ),
    );
  }

  List<Widget> _allParameters(bool enabled, BuildContext context) {
    return [
      Text(
        'Leading, text and Trailing',
        style: TypographyDisplayXxl.medium(context),
      ),
      const SpacingVertical.spacing16(),
      LinkButton.sizeMd(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'LinkButton',
      ),
      const SpacingVertical.spacing04(),
      LinkButton.sizeXl(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'LinkButton',
      ),
      const SpacingVertical.spacing04(),
      LinkButton.size2Xl(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'LinkButton',
      ),
    ];
  }

  List<Widget> _leadingAndText(bool enabled, BuildContext context) {
    return [
      Text(
        'Leading and text',
        style: TypographyDisplayXxl.medium(context),
      ),
      const SpacingVertical.spacing16(),
      LinkButton.sizeMd(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'LinkButton',
      ),
      const SpacingVertical.spacing04(),
      LinkButton.sizeXl(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'LinkButton',
      ),
      const SpacingVertical.spacing04(),
      LinkButton.size2Xl(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'LinkButton',
      ),
    ];
  }
}
