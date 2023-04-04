import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class IconsStory implements DefaultStory {
  @override
  String? get description => 'Icons schemes';

  @override
  String get name => 'Design System/Design tokens/Icons';

  @override
  Widget buildStory(BuildContext context) {
    final color = context.knobs.nullable.options(
      label: 'Color',
      options: const [
        Option(
          label: 'neutral500',
          value: Colors.neutral500,
        ),
        Option(
          label: 'primary500',
          value: Colors.primary500,
        ),
        Option(
          label: 'danger500',
          value: Colors.danger500,
        ),
      ],
      initial: null,
    );

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: Spacings.spacing08,
        crossAxisSpacing: Spacings.spacing08,
      ),
      itemBuilder: (context, index) {
        final icon = Icons.values[index];
        return Center(
          child: Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(Spacings.spacing16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon.iconCopyWith(
                  color: color,
                ),
                const SizedBox(
                  height: Spacings.spacing04,
                ),
                Text(
                  icon.name,
                  style: TypographyTextXs.bold(context).copyWith(
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
