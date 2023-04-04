import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'list_dot_widget.dart';

class ProductGoalsWidget extends StatelessWidget {
  const ProductGoalsWidget({
    Key? key,
    required this.presenter,
    required this.goals,
  }) : super(key: key);

  final UpdatePresenter presenter;
  final List<String>? goals;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: presenter,
      builder: (context) {
        if (goals != null) {
          return Column(
            children: [
              SectionHeaderWidget(
                title: R.string.goalsTitle,
              ),
              const SpacingVertical.spacing12(),
              ExpandWidget(
                collapsedHeight: Sizes.size184,
                expandText: R.string.seeMore,
                retractText: R.string.seeLess,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size04,
                    horizontal: Sizes.size12,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return ListDotWidget(text: goals![index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SpacingVertical.spacing12();
                    },
                    itemCount: goals!.length,
                  ),
                ),
              )
            ],
          );
        }
        return const EmptyWidget();
      },
    );
  }
}
