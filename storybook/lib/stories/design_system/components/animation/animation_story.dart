import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AnimationStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Animation';

  @override
  String get description => 'Animation types';

  @override
  Widget buildStory(BuildContext context) {
    final selectedAnimation = context.knobs.options(
      label: 'Animation',
      initial: null,
      options: Animations.values
          .map((e) => Option(label: e.name, value: e))
          .toList(),
    );
    final repeatAnimation =
        context.knobs.boolean(label: 'Repeat', initial: true);
    return Column(
      children: [
        Text(
          'Animations',
          style: TypographyDisplayMd.bold(context),
        ),
        const SpacingVertical.spacing32(),
        if (selectedAnimation == null)
          const TextWidget.textMdNormal(text: 'Select a animation in knobs'),
        if (selectedAnimation != null)
          Expanded(
            child: AnimationWidget(
              animation: selectedAnimation,
              repeat: repeatAnimation,
            ),
          ),
      ],
    );
  }
}
