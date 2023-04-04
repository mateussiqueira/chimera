import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class ToastStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Toast';

  @override
  String get description => 'Toast';

  @override
  Widget buildStory(BuildContext context) {
    return const ToastPage();
  }
}

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<ToastPage> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.neutral050,
      body: Center(
          child: MaterialButton(
        onPressed: () => show(),
        child: Text(
          'Show Toast',
          style: TypographyTextSm.bold(context)
              .copyWith(color: Colors.grayBlue900),
        ),
      )),
    );
  }

  void show() {
    ToastWidget.show(
      message: 'Verifique sua internet e tente novamente',
      icon: Icons.wifi.iconCopyWith(color: Colors.white),
    );
  }
}
