import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TertiaryButtonStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Buttons/Tertiary Button';

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
      TertiaryButton.sizeMd(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'TertiaryButton',
      ),
      const SpacingVertical.spacing04(),
      TertiaryButton.sizeXl(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'TertiaryButton',
      ),
      const SpacingVertical.spacing04(),
      TertiaryButton.size2Xl(
        leadingIcon: Icons.airplay,
        trailingIcon: Icons.airpods,
        onPressed: enabled ? () {} : null,
        text: 'TertiaryButton',
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
      TertiaryButton.sizeMd(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'TertiaryButton',
      ),
      const SpacingVertical.spacing04(),
      TertiaryButton.sizeXl(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'TertiaryButton',
      ),
      const SpacingVertical.spacing04(),
      TertiaryButton.size2Xl(
        leadingIcon: Icons.airplay,
        onPressed: enabled ? () {} : null,
        text: 'TertiaryButton',
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
      TertiaryButton.iconMd(
        icon: Icons.airplay,
        onPressed: enabled ? () {} : null,
      ),
      const SpacingVertical.spacing04(),
      TertiaryButton.iconXl(
        icon: Icons.airplay,
        onPressed: enabled ? () {} : null,
      ),
      const SpacingVertical.spacing04(),
      TertiaryButton.icon2Xl(
        icon: Icons.airplay,
        onPressed: enabled ? () {} : null,
      ),
    ];
  }
}
