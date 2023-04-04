import 'package:design_system/design_system.dart';

import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook/stories/design_system/resources/typography/typography_list.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TypographyStory implements DefaultStory {
  @override
  String? get description => 'Typography schemes';

  @override
  String get name => 'Design System/Design tokens/Typography';

  @override
  Widget buildStory(BuildContext context) {
    return _textsRows(
      context.knobs.options(
        label: 'Text Styles',
        initial: TypographyList.allStyles,
        description: 'Available Texts Styles scheme',
        options: [
          Option(
            label: 'All Styles',
            value: TypographyList.allStyles,
            description: 'All Styles',
          ),
          const Option(
            label: 'Text Xs',
            value: TypographyList.textXs,
            description: 'Text Xs Style',
          ),
          const Option(
            label: 'Text Sm',
            value: TypographyList.textSm,
            description: 'Text Sm Style',
          ),
          const Option(
            label: 'Text Md',
            value: TypographyList.textMd,
            description: 'Text Md Style',
          ),
          const Option(
            label: 'Text Lg',
            value: TypographyList.textLg,
            description: 'Text Lg Style',
          ),
          const Option(
            label: 'Text Xl',
            value: TypographyList.textXl,
            description: 'Text Xl Style',
          ),
          const Option(
            label: 'Display Md',
            value: TypographyList.displayMd,
            description: 'Display Md Style',
          ),
          const Option(
            label: 'Display Lg',
            value: TypographyList.displayLg,
            description: 'Display Md Style',
          ),
          const Option(
            label: 'Display Xxl',
            value: TypographyList.displayXxl,
            description: 'Display Xxl Style',
          ),
        ],
      ),
    );
  }

  Widget _textsRows(List<TextWidget> widgetsList) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        primary: true,
        separatorBuilder: (context, index) => const SpacingVertical.spacing04(),
        itemCount: widgetsList.length,
        itemBuilder: ((context, index) {
          final textWidget = widgetsList[index];
          return textWidget;
        }),
      ),
    );
  }
}
