import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook/stories/design_system/resources/colors/colors_list.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class ColorsStory implements DefaultStory {
  @override
  String? get description => 'Colors schemes';

  @override
  String get name => 'Design System/Design tokens/Colors';

  @override
  Widget buildStory(BuildContext context) {
    return _gridGenerator(
      context.knobs.options(
        label: 'Colors',
        initial: ColorsList.baseColors,
        description: 'Available colors scheme',
        options: [
          Option(
            label: 'Base',
            value: ColorsList.baseColors,
            description: 'Base Colors',
          ),
          Option(
            label: 'Neutral',
            value: ColorsList.neutralColors,
            description: 'Neutral Colors',
          ),
          Option(
            label: 'Primary',
            value: ColorsList.primaryColors,
            description: 'Primary Colors',
          ),
          Option(
            label: 'Danger',
            value: ColorsList.dangerColors,
            description: 'Danger Colors',
          ),
          Option(
            label: 'Warning',
            value: ColorsList.warningColors,
            description: 'Warning Colors',
          ),
          Option(
            label: 'Success',
            value: ColorsList.successColors,
            description: 'Success Colors',
          ),
          Option(
            label: 'Gray Blue',
            value: ColorsList.grayBlueColors,
            description: 'Gray Blue Colors',
          ),
          Option(
            label: 'Gray Cool',
            value: ColorsList.grayCoolColors,
            description: 'Gray Cool Colors',
          ),
          Option(
            label: 'Gray Modern',
            value: ColorsList.grayModernColors,
            description: 'Gray Modern Colors',
          ),
          Option(
            label: 'Gray Neutral',
            value: ColorsList.grayNeutralColors,
            description: 'Gray Neutral Colors',
          ),
          Option(
            label: 'Gray Iron',
            value: ColorsList.grayIronColors,
            description: 'Gray Iron Colors',
          ),
          Option(
            label: 'Gray True',
            value: ColorsList.grayTrueColors,
            description: 'Gray True Colors',
          ),
          Option(
            label: 'Gray Warm',
            value: ColorsList.grayWarmColors,
            description: 'Gray Warm Colors',
          ),
          Option(
            label: 'Moss',
            value: ColorsList.mossColors,
            description: 'Moss Colors',
          ),
          Option(
            label: 'Green Light',
            value: ColorsList.greenLightColors,
            description: 'Green Light Colors',
          ),
          Option(
            label: 'Green',
            value: ColorsList.greenColors,
            description: 'Green Colors',
          ),
          Option(
            label: 'Teal',
            value: ColorsList.tealColors,
            description: 'Teal Colors',
          ),
          Option(
            label: 'Cyan',
            value: ColorsList.cyanColors,
            description: 'Cyan Colors',
          ),
          Option(
            label: 'Blue Light',
            value: ColorsList.blueLightColors,
            description: 'Blue Light Colors',
          ),
          Option(
            label: 'Blue',
            value: ColorsList.blueColors,
            description: 'Blue Colors',
          ),
          Option(
            label: 'Blue Dark',
            value: ColorsList.blueDarkColors,
            description: 'Blue Dark Colors',
          ),
          Option(
            label: 'Indigo',
            value: ColorsList.indigoColors,
            description: 'Indigo Colors',
          ),
          Option(
            label: 'Violet',
            value: ColorsList.violetColors,
            description: 'Violet Colors',
          ),
          Option(
            label: 'Purple',
            value: ColorsList.purpleColors,
            description: 'Purple Colors',
          ),
          Option(
            label: 'Fuchsia',
            value: ColorsList.fuchsiaColors,
            description: 'Fuchsia Colors',
          ),
          Option(
            label: 'Pink',
            value: ColorsList.pinkColors,
            description: 'Pink Colors',
          ),
          Option(
            label: 'Rose',
            value: ColorsList.roseColors,
            description: 'Rose Colors',
          ),
          Option(
            label: 'Orange Dark',
            value: ColorsList.orangeDarkColors,
            description: 'Orange Colors',
          ),
          Option(
            label: 'Orange',
            value: ColorsList.orangeColors,
            description: 'Orange',
          ),
          Option(
            label: 'Yellow',
            value: ColorsList.yellowColors,
            description: 'Yellow',
          ),
        ],
      ),
    );
  }

  Widget _gridGenerator(Map<String, Color> colors) {
    return GridView.builder(
      itemCount: colors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (
        context,
        index,
      ) {
        final currentColor = colors.entries.toList()[index];
        return Container(
          color: currentColor.value,
          height: 160,
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                currentColor.key,
                style: TypographyTextXs.bold(context).copyWith(
                  color: currentColor.value.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              Text(
                colorToHexString(currentColor.value),
                style: TypographyTextXs.bold(context).copyWith(
                  color: currentColor.value.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                ),
              )
            ]),
          ),
        );
      },
    );
  }

  String colorToHexString(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8).toUpperCase()}';
  }
}
