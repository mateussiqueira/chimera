// ignore_for_file: must_be_immutable

import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class WriteCommentBottomSheet extends StatefulWidget {
  const WriteCommentBottomSheet({
    super.key,
  });

  @override
  State<WriteCommentBottomSheet> createState() =>
      _WriteCommentBottomSheetState();
}

class _WriteCommentBottomSheetState extends State<WriteCommentBottomSheet> {
  String? userRating;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      body: Column(
        children: [
          InputBaseWidget(
            maxLines: 6,
            textInputType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            radius: Sizes.size08,
            placeHolder: R.string.writeYourAnswerHere,
            onChanged: (e) {
              setState(() {
                userRating = e;
              });
            },
          ),
          const SpacingVertical.spacing16(),
          ButtonsOkCancelHorizontalWidget(
            primaryButtonTitle: R.string.send,
            primaryButtonOnPressed: userRating?.isNotEmpty == true
                ? () {
                    if (userRating?.isNotEmpty == true) {
                      Navigator.of(context).pop(userRating);
                    }
                  }
                : null,
            secondaryButtonTitle: R.string.cancel,
            secondaryButtonOnPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      ),
      title: R.string.howCanWeImprove,
    );
  }
}
