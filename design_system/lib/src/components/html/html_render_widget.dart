import 'package:design_system/design_system.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class HtmlRenderWidget extends StatelessWidget {
  const HtmlRenderWidget({super.key, required this.html});

  final String html;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(html);
  }
}
