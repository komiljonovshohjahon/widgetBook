import 'package:widgetbook_2/smart_house_widgets/layout/default_body.dart';
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class ConstructorOfPages extends StatelessWidget {
  final List<Widget> children;
  final List<String> tabNames;
  List<double>? viewHeights;
  int initIndex;

  ConstructorOfPages(
      {required this.children,
      required this.tabNames,
      this.viewHeights,
      required this.initIndex});

  @override
  Widget build(BuildContext context) {
    return DefaultBody(
        CustomTabController(
            children: children,
            tabNames: tabNames,
            viewHeights: viewHeights,
            initIndex: initIndex),
        showBottomAppBar: false);
  }
}
