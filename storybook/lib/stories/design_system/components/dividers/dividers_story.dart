import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class DividersStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Dividers';

  @override
  String get description => 'A separate content widget';

  @override
  Widget buildStory(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
          children: [
            Text(
              'HorizontalDivider:',
              style: TypographyDisplayXxl.medium(context),
            ),
            const SpacingVertical.spacing08(),
            const HorizontalDividerWidget(
              style: HorizontalDividerStyle(dividerColor: Colors.neutral800),
            ),
            const SpacingVertical.spacing32(),
            Text(
              'HorizontalDivider (text separator):',
              style: TypographyDisplayXxl.medium(context),
            ),
            const SpacingVertical.spacing08(),
            const HorizontalDividerWidget(
              text: 'Ou acesse com:',
              style: HorizontalDividerStyle(
                dividerColor: Colors.neutral800,
                foregroundColor: Colors.neutral900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
