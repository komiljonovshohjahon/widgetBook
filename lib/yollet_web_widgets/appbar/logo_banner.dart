import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class LogoBanner extends StatelessWidget {
  double? height;
  bool? noLink;
  LogoBanner({Key? key, this.height = 64, this.noLink = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        color: ThemeColors.orange500,
        child: Center(
            child: Image.asset('icons/1.5x/yollet_logo.png',
                width: 110, height: 30)));
  }
}

@WidgetbookUseCase(name: 'App Bar', type: LogoBanner)
Widget defaultLogoBannerStory() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LogoBanner(),
      const SizedBox(height: 50),
      Row(
        children: [
          Navigationbar(
            active: 0,
            icons: const [
              HeroIcons.academicCap,
              HeroIcons.user,
              HeroIcons.adjustments
            ],
            tabsLength: 3,
            names: const ['Store Basic', 'Store Payment', 'Store Account'],
          ),
          const SizedBox(width: 50),
          InfoBanner(
            mainText: 'Info banner',
            secondaryText: 'Info banner secondary',
            lowerTextColor: ThemeColors.coolgray500,
          ),
        ],
      ),
      const SizedBox(height: 50),
      DefaultTopbar(),
    ],
  );
}
