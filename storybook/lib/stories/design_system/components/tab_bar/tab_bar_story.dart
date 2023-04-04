import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class TabBarStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/TabBar';

  @override
  String get description => 'TabBar';

  @override
  Widget buildStory(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Text(
            'Tab Bar',
            style: TypographyDisplayXxl.medium(context),
          ),
          const TabBarWidget(
            tabs: [
              Tab(
                child: Text("Tab 1"),
              ),
              Tab(
                child: Text("Tab 2"),
              ),
              Tab(
                child: Text("Tab 3"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
