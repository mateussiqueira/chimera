import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/content/content.dart';
import 'package:learning/src/ui/styles/learning_module_style.dart';

import 'content_app_bar_style.dart';

class ContentAppBarWidget extends AppBarWidget implements PreferredSizeWidget {
  ContentAppBarWidget({
    super.key,
    required BuildContext context,
    required this.presenter,
  }) : super(
          title: ListenableBuilder(
            listenable: presenter,
            builder: (context) {
              return TextWidget.textMdNormal(
                text: presenter.content?.name ?? '',
                style: moduleStyle.secondary
                    .textModuleStyleWithPrimaryColor(context),
              );
            },
          ),
          titleColor: context.resolveStyle<ContentAppBarStyle>()?.textColor ??
              moduleStyle.secondary.textModulePrimaryColor(context),
          backgroundColor:
              context.resolveStyle<ContentAppBarStyle>()?.backgroundColor ??
                  moduleStyle.secondary.backgroundModulePrimaryColor(context),
        );

  final ContentPresenter presenter;
}
