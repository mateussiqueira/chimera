import 'package:design_system/design_system.dart';

import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ProgressStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Progress';

  @override
  String get description => 'Progress';

  @override
  Widget buildStory(BuildContext context) {
    return Column(
      children: [
        Text(
          'LinearProgressBar',
          style: TypographyDisplayXxl.medium(context),
        ),
        const SpacingVertical.spacing08(),
        LinearProgressBarWidget(
          progress: context.knobs.slider(
            label: 'Porcentagem - Linear',
            min: 0,
            max: 1,
            initial: 0.5,
          ),
        ),
        const SpacingVertical.spacing16(),
        Text(
          'CircularProgressBar',
          style: TypographyDisplayXxl.medium(context),
        ),
        const SpacingVertical.spacing08(),
        CircularProgressBarWidget(
          progress: context.knobs.slider(
            label: 'Porcentagem - Circular',
            min: 0,
            max: 1,
            initial: 0.5,
          ),
        ),
      ],
    );
  }
}
