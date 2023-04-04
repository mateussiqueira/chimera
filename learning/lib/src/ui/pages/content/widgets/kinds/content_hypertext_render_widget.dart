import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';

class ContentHyperTextRenderWidget extends StatelessWidget {
  const ContentHyperTextRenderWidget({
    Key? key,
    required this.content,
  }) : super(key: key);

  final ContentEntity content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (urlAvailable)
          Expanded(
            child: WebViewWidget(
              url: content.url!,
            ),
          )
        else
          Center(
            child: TextWidget.textMdNormal(
              text: R.string.contentUnavailable,
              textAlign: TextAlign.center,
              style:
                  moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
            ),
          ),
      ],
    );
  }

  bool get urlAvailable => content.url != null;
}
