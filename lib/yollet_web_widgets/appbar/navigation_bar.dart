import 'dart:developer' as developer;

import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';
import 'package:flutter/material.dart';

class Navigationbar extends StatefulWidget {
  int tabsLength;
  int active;
  List<String> names;
  List<HeroIcons> icons;
  String? id;

  Navigationbar({
    Key? key,
    required this.tabsLength,
    required this.active,
    required this.names,
    required this.icons,
    this.id,
  }) : super(key: key);

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  List<DefaultTab> tabList = [];
  int activeElement = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      activeElement = widget.active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeColors.white,
      ),
      height: 52.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _builtWidgetsDefaultTab(activeElement),
        ),
      ),
    );
  }

  List<Widget> _builtWidgetsDefaultTab(int activeElement) {
    List<Widget> list = [];

    for (int index = 0; index < widget.tabsLength; index++) {
      if (activeElement == index) {
        list.add(DefaultTab(
          text: widget.names[index],
          icon: widget.icons[index],
          isActive: true,
          onTap: () {
            setState(() {
              activeElement = index;
              print(activeElement);
              print(index);
            });
          },
        ));
      } else {
        list.add(DefaultTab(
          text: widget.names[index],
          icon: widget.icons[index],
          onTap: () {
            setState(() {
              activeElement = index;
              print(activeElement);
              print(index);
            });
          },
        ));
      }
    }
    return list;
  }
}

// @WidgetbookUseCase(name: 'Navigation Ban', type: Navigationbar)
// Widget defaultNavigationBarStory(BuildContext context) {
//   return Navigationbar(
//     active: 1,
//     icons: [],
//     tabsLength: 1,
//     names: [],
//   );
// }
