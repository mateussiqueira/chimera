import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:discovery/discovery.dart';

import '../../../styles/checkout_module_style.dart';

class CourseCardWidget extends StatelessWidget {
  const CourseCardWidget({
    super.key,
    required this.course,
    required this.delete,
  });

  final OffersEntity? course;
  final Function({required String offerId}) delete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.size06),
              child: NetworkImageWidget(
                height: Sizes.size84,
                width: Sizes.size128,
                fit: BoxFit.cover,
                url: course?.media?.cardImage,
              ),
            ),
            const SpacingHorizontal.spacing12(),
            FittedBox(
              child: SizedBox(
                width: Sizes.size152,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget.textSmMedium(
                      text: course?.name ?? '',
                      style: moduleStyle.primary
                          .textModuleStyleWithPrimaryColor(context),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SpacingVertical.spacing04(),
                    TextWidget.textSmBold(
                      text: R.string.price(
                        course?.price?.cents ?? 0,
                        course?.price?.currencyIso ?? 'BRL',
                      ),
                      style: moduleStyle.primary
                          .textModuleStyleWithPrimaryColor(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SecondaryButton.iconXl(
          icon: Icons.trash04,
          onPressed: () {
            delete(offerId: course?.id ?? '');
          },
        ),
      ],
    );
  }
}
