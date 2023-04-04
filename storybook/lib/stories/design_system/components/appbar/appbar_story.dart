import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class AppbarStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Appbar';

  @override
  String get description => 'AppBar types';

  @override
  Widget buildStory(BuildContext context) {
    return Column(
      children: [
        Text(
          'Primary AppBar',
          style: TypographyDisplayMd.bold(context),
        ),
        const SpacingVertical.spacing32(),
        SizedBox(
          height: kToolbarHeight,
          child: PrimaryAppBarWidget(title: "Meus Cursos"),
        ),
        const SpacingVertical.spacing16(),
        Text(
          'Secondary AppBar',
          style: TypographyDisplayMd.bold(context),
        ),
        const SpacingVertical.spacing32(),
        SizedBox(
          height: kToolbarHeight,
          child: SecondaryAppBarWidget(
            title: "CCD em Gestão de Pessoas e Liderança",
          ),
        ),
      ],
    );
  }
}
