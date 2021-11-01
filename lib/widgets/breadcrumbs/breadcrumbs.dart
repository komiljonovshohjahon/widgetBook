import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookStory(name: 'Breadcrumb', type: Breadcrumb)
Widget defaultBreadcrumbStory(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width,
    height: height,
    color: ThemeColors.blue100,
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Breadcrumb(
          routes: ['Home', 'Store List', 'Store Payment Page'],
        ),
      ],
    ),
  );
}

class Breadcrumb extends StatelessWidget {
  List<String> routes;
  Breadcrumb({Key? key, required this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildRoutes(context),
    );
  }

  List<Widget> _buildRoutes(BuildContext context) {
    List<Widget> list = [];
    // list.add(Icon(
    //   Icons.home,
    //   color: ThemeColors.coolgray400,
    // ));
    // list.add(SizedBox(
    //   width: 16,
    // ));
    for (var element in routes) {
      list.add(Text(
          // element,
          element.toString(),
          style: ThemeTextRegular.xs.apply(
            color: ThemeColors.coolgray500,
          )));
      list.add(const SizedBox(
        width: 8,
      ));
      if (routes.last != element) {
        list.add(const HeroIcon(
          HeroIcons.chevronRight,
          color: ThemeColors.coolgray400,
          size: 20,
          solid: true,
        ));
        list.add(const SizedBox(
          width: 8,
        ));
      }
    }
    return list;
  }
}
