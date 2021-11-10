import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/widgets/appbar/navigation_bar.dart';
import 'package:widgetbook_2/widgets/appbar/topbar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class LogoBanner extends StatelessWidget {
  double? height;
  bool? noLink;
  LogoBanner({Key? key, this.height = 64, this.noLink = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: height,
        color: ThemeColors.orange500,
        child: Center(
          child: Image.asset(
            'assets/icons/1.5x/yollet_logo.png',
            width: 112,
            height: 31,
          ),
        ),
      ),
    );
  }
}

@WidgetbookUseCase(name: 'App Bar', type: LogoBanner)
Widget defaultLogoBannerStory(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width,
    height: height,
    color: ThemeColors.blue100,
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 200, child: LogoBanner()),
        SizedBox(height: 50),
        Navigationbar(
          active: 1,
          icons: [
            HeroIcons.academicCap,
            HeroIcons.academicCap,
            HeroIcons.adjustments
          ],
          tabsLength: 2,
          names: ['Store Basic', 'Store Payment', 'Store Account'],
        ),
        SizedBox(height: 50),
        DefaultTopbar(),
      ],
    ),
  );
}
