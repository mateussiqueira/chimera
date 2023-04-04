import 'package:courses/courses.dart';
import 'package:courses/src/ui/styles/courses_module_style.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class NodesGeneratorWidget extends StatelessWidget {
  const NodesGeneratorWidget({
    super.key,
    this.assessmentsProgresses,
    required this.nodes,
    required this.onClickContent,
    required this.onMarkAsCompleted,
    required this.selectedContent,
    this.showMarkButton = true,
  });

  final List<NodeEntity> nodes;
  final List<AssessmentProgressEntity>? assessmentsProgresses;
  final ContentEntity? selectedContent;
  final Function(ContentEntity content) onClickContent;
  final Function(ContentEntity content) onMarkAsCompleted;
  final bool showMarkButton;

  @override
  Widget build(BuildContext context) {
    return generateAccordion(nodes);
  }

  Widget generateAccordion(
    List<NodeEntity> nodes, {
    bool isChildAccordion = false,
  }) {
    return ListView.separated(
      primary: false,
      itemBuilder: (context, index) {
        final node = nodes[index];
        final hasChildrenNodes = node.nodes?.isNotEmpty == true;
        return shouldNotShowAccordion(node)
            ? Container(
                decoration: BoxDecoration(
                  color: moduleStyle.primary
                      .backgroundModuleSecondaryColor(context),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      Sizes.size16,
                    ),
                  ),
                  boxShadow: Shadows.shadowSm,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size16,
                        vertical: Sizes.size12,
                      ),
                      child: TextWidget.textMdMedium(
                        text: R.string.courseContent,
                        style: moduleStyle.primary
                            .textModuleStyleWithPrimaryColor(context),
                      ),
                    ),
                    accordionBody(hasChildrenNodes, node)
                  ],
                ),
              )
            : AccordionWidget(
                expanded: false,
                header: Row(
                  children: [
                    Expanded(
                      child: TextWidget.textSmBold(
                        text: _moduleNameBuilder(index, node.name),
                        style: moduleStyle.primary
                            .textModuleStyleWithPrimaryColor(context),
                      ),
                    ),
                    if (!isChildAccordion && _isCompletedNode(node)) ...[
                      BadgeWidget(
                        backgroundColor: moduleStyle.success
                            .backgroundModulePrimaryColor(context),
                        child: TextWidget.textXsMedium(
                          text: R.string.nodeCompleted,
                          style: moduleStyle.success
                              .textModuleStyleWithPrimaryColor(context),
                        ),
                      ),
                    ]
                  ],
                ),
                body: accordionBody(hasChildrenNodes, node),
              );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SpacingVertical.spacing08();
      },
      itemCount: nodes.length,
      shrinkWrap: true,
    );
  }

  bool shouldNotShowAccordion(NodeEntity node) {
    bool idAreEqual =
        node.id?.isNotEmpty == true && node.id == nodes.getOrNull(0)?.id;
    bool hasOnlyOneNode = nodes.length == 1;
    return idAreEqual && hasOnlyOneNode;
  }

  Widget accordionBody(bool hasChildrenNodes, NodeEntity node) {
    return Column(
      children: [
        if (hasChildrenNodes)
          generateAccordion(
            node.nodes!,
            isChildAccordion: true,
          ),
        NodeContentGeneratorWidget(
          assessmentsProgresses: assessmentsProgresses,
          contents: node.contents,
          onClickContent: onClickContent,
          onMarkAsCompleted: onMarkAsCompleted,
          selectedContent: selectedContent,
          showMarkButton: showMarkButton,
        ),
      ],
    );
  }

  bool _isCompletedNode(NodeEntity node) {
    return _recursiveIsCompletedNode([node]);
  }

  bool _recursiveIsCompletedNode(List<NodeEntity> nodes) {
    bool isCompleted = true;
    for (final node in nodes) {
      final hasUncompleted = node.contents?.any(
        (element) => !(element as RemoteContentModel).isCompleted,
      );
      if (hasUncompleted == true) {
        return false;
      }
      if (node.nodes != null) {
        final childrenCompleted = _recursiveIsCompletedNode(node.nodes!);
        if (childrenCompleted == false) {
          isCompleted = false;
        }
      }
    }
    return isCompleted;
  }

  String _moduleNameBuilder(int index, String? name) {
    final modNumber = '${R.string.module} ${index + 1}';
    var modName = modNumber;
    if (name != null && name.isNotEmpty) {
      modName = '$modName - $name';
    }
    return modName;
  }
}
