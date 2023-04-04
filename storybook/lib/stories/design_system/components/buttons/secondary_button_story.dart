import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SecondaryButtonStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Buttons/Secondary Button';

  @override
  String? get description => 'Medium emphasis button';

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
            ..._loadingIcon(enabled, context),
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
      SecondaryButton.sizeMd(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'SecondaryButton',
      ),
      const SpacingVertical.spacing04(),
      SecondaryButton.sizeXl(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'SecondaryButton',
      ),
      const SpacingVertical.spacing04(),
      SecondaryButton.size2Xl(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'SecondaryButton',
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
      SecondaryButton.sizeMd(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'SecondaryButton',
      ),
      const SpacingVertical.spacing04(),
      SecondaryButton.sizeXl(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'SecondaryButton',
      ),
      const SpacingVertical.spacing04(),
      SecondaryButton.size2Xl(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'SecondaryButton',
      ),
    ];
  }

  List<Widget> _loadingIcon(bool enabled, BuildContext context) {
    return [
      Text(
        'Only icon',
        style: TypographyDisplayXxl.medium(context),
      ),
      const SpacingVertical.spacing16(),
      SecondaryButton.iconMd(
        icon: Icons.airplay,
        onPressed: enabled ? () {} : null,
      ),
      const SpacingVertical.spacing04(),
      SecondaryButton.iconXl(
        icon: Icons.airplay,
        onPressed: enabled ? () {} : null,
      ),
      const SpacingVertical.spacing04(),
      SecondaryButton.icon2Xl(
        icon: Icons.airplay,
        onPressed: enabled ? () {} : null,
      ),
    ];
  }
}
