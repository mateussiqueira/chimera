import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:storybook_flutter/storybook_flutter.dart';

import 'stories/core/story_generator.dart';
import 'stories/design_system/design_system.dart';

void main() => runApp(const StoryBookApp());

class StoryBookApp extends StatelessWidget {
  const StoryBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Storybook(
      plugins: _plugins,
      stories: StoryGenerator.generate(
        [
          ColorsStory(),
          TypographyStory(),
          IconsStory(),
          PrimaryButtonStory(),
          SecondaryButtonStory(),
          TertiaryButtonStory(),
          LinkButtonStory(),
          SocialButtonStory(),
          CheckboxStory(),
          InputsStory(),
          DividersStory(),
          LoadingStory(),
          ToastStory(),
          LoginStory(),
          ProgressStory(),
          CardStory(),
          AccordionStory(),
          AppbarStory(),
          AnimationStory(),
          TabBarStory(),
          WebViewStory(),
          ExpandStory(),
        ],
      ),
      wrapperBuilder: (context, child) {
        return materialAppWrapperBuilder(context, child);
      },
    );
  }

  MaterialApp materialAppWrapperBuilder(BuildContext context, Widget? child) {
    return MaterialApp(
      theme: DesignSystemThemes.light,
      darkTheme: DesignSystemThemes.light,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: child,
          ),
        ),
      ),
      builder: LoadingWidget.init(),
    );
  }

  static Iterable<Plugin> get _plugins => initializePlugins(
        contentsSidePanel: kIsWeb,
        knobsSidePanel: kIsWeb,
        initialDeviceFrameData: _deviceFrameData,
      );

  static DeviceFrameData get _deviceFrameData {
    if (kIsWeb) {
      return DeviceFrameData(
        device: Devices.ios.iPhone13,
      );
    }
    return const DeviceFrameData();
  }
}
