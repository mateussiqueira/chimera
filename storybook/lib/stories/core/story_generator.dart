import 'package:storybook_flutter/storybook_flutter.dart';

import 'default_story.dart';

class StoryGenerator {
  static List<Story> generate(List<DefaultStory> stories) {
    return stories
        .map(
          (e) => Story(
            name: e.name,
            builder: (context) => e.buildStory(context),
            description: e.description,
          ),
        )
        .toList();
  }
}
