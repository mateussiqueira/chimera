import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/src/ui/pages/pages.dart';
import 'package:discovery/src/ui/pages/search_home/widgets/widgets.dart';

import '../../widgets/widgets.dart';

class SearchHomePage extends StatelessWidget {
  const SearchHomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final SearchHomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBaseWidget(
      appBar: PrimaryAppBarWidget(
        title: R.string.search,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Sizes.size16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: const AbsorbPointer(
                child: SearchWidget(),
              ),
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed('/discovery/search');
              },
            ),
            const SpacingVertical.spacing20(),
            const TopSearchesWidget(),
            const SpacingVertical.spacing16(),
            SearchCategoriesWidget(presenter: presenter),
            const SpacingVertical.spacing16(),
            SuggestionForYouWidget(
              presenter: presenter,
            ),
          ],
        ),
      ),
    );
  }
}
