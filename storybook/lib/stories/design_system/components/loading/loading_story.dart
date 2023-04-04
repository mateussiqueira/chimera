import 'package:design_system/design_system.dart';

import 'package:storybook/stories/core/default_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LoadingStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Loading';

  @override
  String get description => 'Loading';

  @override
  Widget buildStory(BuildContext context) {
    return const LoadingPage();
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool enabled = false;
  @override
  void initState() {
    super.initState();
    LoadingWidget.setLoadingInteraction(true);
  }

  @override
  Widget build(BuildContext context) {
    enabled = context.knobs.boolean(
        label: 'Show', description: 'Show/Hide loading', initial: enabled);
    enabled ? show() : hide();
    return Scaffold(
      backgroundColor: Colors.primary900,
      body: Center(
        child: Text(
          'Clique no checkbox a direita\npara mostrar/esconder o loading',
          style: TypographyTextSm.bold(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }

  void show() {
    LoadingWidget.show();
  }

  void hide() {
    LoadingWidget.hide();
  }
}
