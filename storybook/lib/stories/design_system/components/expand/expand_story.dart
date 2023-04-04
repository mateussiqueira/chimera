import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class ExpandStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Expand';

  @override
  String get description => 'Expand';

  @override
  Widget buildStory(BuildContext context) {
    return Column(
      children: [
        Text(
          'Expand',
          style: TypographyDisplayXxl.medium(context),
        ),
        const SpacingVertical.spacing24(),
        ExpandWidget(
          expandText: 'Ver mais',
          retractText: 'Ver menos',
          child: Text(_text),
        ),
      ],
    );
  }

  final _text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et erat ornare, lobortis diam ac, facilisis orci. Morbi posuere libero a ornare pharetra. Ut sed sem tempus, tristique massa eu, lobortis diam. Maecenas hendrerit nulla purus, ut pellentesque lacus suscipit a. Praesent in bibendum arcu. Sed tempor tortor sed risus commodo tristique. Vivamus efficitur pharetra sapien, eget ultricies libero posuere nec. Vestibulum vel lectus leo. Nullam id dignissim justo, sit amet convallis nisi. Nulla ut rutrum mi, blandit convallis magna. Aenean hendrerit pretium mattis. Ut pretium ut sem sodales mollis. Aenean volutpat aliquet fermentum. In bibendum et diam bibendum tempus. Aliquam erat volutpat. Nam id velit sit amet leo mattis consequat";
}
