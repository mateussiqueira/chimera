import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:profile/src/ui/ui.dart';

import 'widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    Key? key,
    required this.presenter,
  }) : super(key: key) {
    presenter.init();
  }

  final ProfilePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: PrimaryAppBarWidget(title: R.string.profile),
      body: ListenableBuilder(
          listenable: presenter,
          builder: (context) {
            final isLoading = presenter.isUserLoggedIn() == null;
            if (isLoading) {
              return const EmptyWidget();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.size16),
                child: Column(
                  children: [
                    ProfileUserWidget(
                      presenter: presenter,
                    ),
                    MenuListWidget(
                      presenter: presenter,
                    ),
                    const SpacingVertical.spacing24(),
                    ListenableBuilder(
                      listenable: presenter,
                      builder: (context) => TextWidget.textMdMedium(
                        text: "${R.string.version} ${presenter.version}",
                        style: moduleStyle.primary
                            .textModuleStyleWithTertiaryColor(context),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
