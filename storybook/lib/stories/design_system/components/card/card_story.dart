import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class CardStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Card';

  @override
  String get description => 'A high emphasis container';

  @override
  Widget buildStory(BuildContext context) {
    return Column(
      children: [
        Text(
          'Card:',
          style: TypographyDisplayXxl.medium(context),
        ),
        const SpacingVertical.spacing08(),
        const CardWidget(
          child: Text("Hello from card!"),
        ),
        const SpacingVertical.spacing32(),
        Text(
          'Big card:',
          style: TypographyDisplayXxl.medium(context),
        ),
        const SpacingVertical.spacing08(),
        const CardWidget(
          height: Sizes.size256,
          width: Sizes.size256,
          child: Center(
            child: Text(
              "Big card!",
            ),
          ),
        ),
      ],
    );
  }
}
