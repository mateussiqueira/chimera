import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/content/content.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';
import '../mark_as_completed_button.dart';

class ContentVideoRenderWidget extends StatelessWidget {
  const ContentVideoRenderWidget({
    Key? key,
    required this.content,
    required this.presenter,
  }) : super(key: key);

  final ContentEntity content;
  final ContentPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: alignment(context),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (urlAvailable) ...[
          AspectRatio(
            aspectRatio: aspecRatio(context),
            child: WebViewWidget(
              url: content.url!,
              clearCache: true,
            ),
          ),
          const SpacingVertical.spacing24(),
          Center(
            child: ListenableBuilder(
              listenable: presenter,
              builder: (context) {
                return MarkAsCompletedButton(
                  onPressed: () => presenter.toggleCompleted(content),
                  isCompleted:
                      (presenter.content as RemoteContentModel).isCompleted,
                );
              },
            ),
          ),
        ] else
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

  MainAxisAlignment alignment(BuildContext context) {
    return isTablet(context) && isLandscape(context)
        ? MainAxisAlignment.start
        : MainAxisAlignment.center;
  }

  double aspecRatio(BuildContext context) {
    return isTablet(context) && isLandscape(context) ? 21 / 9 : 16 / 9;
  }

  bool isTablet(BuildContext context) {
    return ResponsiveLayoutWidget.isTablet(context);
  }

  bool isLandscape(BuildContext context) {
    return ResponsiveLayoutWidget.isLandscape(context);
  }
}
