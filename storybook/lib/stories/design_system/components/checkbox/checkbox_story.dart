import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

import 'checkbox_list.dart';

class CheckboxStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Checkbox';

  @override
  String get description => 'Checkboxes and Radio Buttons';

  @override
  Widget buildStory(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    getGrid(CheckboxList.smListCheckbox),
                    const SpacingVertical.spacing32(),
                    getGrid(CheckboxList.smListRadio),
                  ],
                ),
              ),
            ),
            const SpacingHorizontal.spacing32(),
            Expanded(
              child: Column(
                children: [
                  getGrid(CheckboxList.mdListCheckbox),
                  const SpacingVertical.spacing32(),
                  getGrid(CheckboxList.mdListRadio),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getGrid(List<Widget> list, {int columns = 2}) {
    return GridView.count(
      crossAxisCount: columns,
      shrinkWrap: true,
      mainAxisSpacing: Spacings.spacing08,
      crossAxisSpacing: Spacings.spacing08,
      children: [
        for (var item in list) Center(child: item),
      ],
    );
  }
}
