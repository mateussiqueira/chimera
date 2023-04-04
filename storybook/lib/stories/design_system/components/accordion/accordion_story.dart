import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class AccordionStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Accordion';

  @override
  String get description => 'Accordion (formally dropdown)';

  @override
  Widget buildStory(BuildContext context) {
    return Container(
      color: Colors.blue100,
      child: Column(
        children: [
          Text(
            'Accordion with children',
            style: TypographyDisplayXxl.medium(context),
          ),
          Expanded(
            child: AccordionWidget(
              expanded: false,
              header: const Text('Children'),
              body: SizedBox(
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    const ListTile(
                      title: Text('Conteúdo online'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AccordionWidget(
                        expanded: false,
                        header: const Text('Child 1'),
                        body: ListView(
                          primary: false,
                          shrinkWrap: true,
                          children: const [
                            ListTile(
                              title: Text('Conteúdo online'),
                            ),
                            ListTile(
                              title: Text('Videoaula 1'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ListTile(
                      title: Text('Conteúdo online'),
                    ),
                    const ListTile(
                      title: Text('Videoaula 1'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
