import 'package:courses/courses.dart';
import 'package:courses/src/ui/widgets/assessment_content_widget.dart';
import 'package:design_system/design_system.dart';

import '../styles/courses_module_style.dart';

class NodeContentGeneratorWidget extends StatelessWidget {
  const NodeContentGeneratorWidget({
    Key? key,
    this.assessmentsProgresses,
    required this.contents,
    required this.onClickContent,
    required this.onMarkAsCompleted,
    required this.selectedContent,
    required this.showMarkButton,
  }) : super(key: key);

  final List<AssessmentProgressEntity>? assessmentsProgresses;
  final List<ContentEntity>? contents;
  final ContentEntity? selectedContent;
  final Function(ContentEntity content) onClickContent;
  final Function(ContentEntity content) onMarkAsCompleted;
  final bool showMarkButton;

  @override
  Widget build(BuildContext context) {
    if (contents == null) {
      return const EmptyWidget();
    }
    return ListView.separated(
      primary: false,
      itemBuilder: (context, index) {
        final content = contents![index] as RemoteContentModel;
        return content.coreKind == ContentKind.assessment
            ? AssessmentContentWidget(
                content: content,
                model: LocalAssessmentHelperModel.fromAssessmentProgresses(
                  assessmentsProgresses,
                  content,
                ),
                onClickContent: onClickContent,
                isSelected: isSelectedContent(content),
                title: isSelectedContent(content)
                    ? selectedTitle(content, context)
                    : unselectedTitle(content, context),
              )
            : row(content, context);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
          ),
          child: HorizontalDividerWidget(
            style: HorizontalDividerStyle(
              dividerColor:
                  moduleStyle.primary.backgroundModulePrimaryColor(context),
            ),
          ),
        );
      },
      itemCount: contents!.length,
      shrinkWrap: true,
    );
  }

  Widget row(RemoteContentModel content, BuildContext context) {
    return GestureDetector(
      onTap: () => onClickContent.call(content),
      child: ColoredBox(
        color: isSelectedContent(content)
            ? context
                    .resolveStyle<AccordionStyle>()
                    ?.backgroundRowSelectedColor ??
                moduleStyle.primary.backgroundModulePrimaryColor(context) ??
                Colors.transparent
            : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
            vertical: Sizes.size12,
          ),
          child: Row(
            children: [
              Expanded(
                child: isSelectedContent(content)
                    ? selectedTitle(content, context)
                    : unselectedTitle(content, context),
              ),
              const SpacingHorizontal.spacing04(),
              if (showMarkButton)
                GestureDetector(
                  onTap: () {
                    onMarkAsCompleted.call(content);
                  },
                  child: Icons.checkCircle.iconCopyWith(
                    color: content.isCompleted
                        ? moduleStyle.success.textModulePrimaryColor(context)
                        : moduleStyle.secondary
                            .textModuleSecondaryColor(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool isSelectedContent(ContentEntity content) =>
      selectedContent?.id == content.id;

  Widget selectedTitle(ContentEntity content, BuildContext context) {
    return TextWidget.textSmMedium(
      text: content.name ?? '',
      overflow: TextOverflow.ellipsis,
      style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
    );
  }

  Widget unselectedTitle(ContentEntity content, BuildContext context) {
    return TextWidget.textSmNormal(
      text: content.name ?? '',
      overflow: TextOverflow.ellipsis,
      style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
    );
  }
}
