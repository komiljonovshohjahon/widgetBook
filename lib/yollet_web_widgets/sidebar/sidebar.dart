import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:widgetbook_2/base/theme_additional.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/widgets/appbar/logo_banner.dart';
import 'package:widgetbook_2/widgets/banner/info_banner.dart';
import 'package:widgetbook_2/widgets/sidebar/sidebar_tab_parent.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'SideBar Vertical', type: SideBarVertical)
Widget defaultSideBarVerticalStory(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return Container(
    width: width,
    height: height,
    color: ThemeColors.blue100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: width / 6, height: height, child: SideBarVertical()),
      ],
    ),
  );
}

class SideBarVertical extends StatelessWidget {
  String? mainText;
  String? secondaryText;
  String? imageUrl;

  SideBarVertical({
    Key? key,
    this.mainText = 'good_morning',
    this.secondaryText = 'username@mail.com',
    this.imageUrl = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.white,
        boxShadow: ThemeShadows.shadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoBanner(),
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 20),
                child: InfoBanner(
                  image: imageUrl!,
                  mainText: mainText!,
                  secondaryText: secondaryText!,
                  lowerTextColor: ThemeColors.coolgray500,
                ),
              ),
              SizedBox(
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Column(
                      children: [
                        SidebarTabParent(
                          index: 1,
                          icon: HeroIcons.documentText,
                          name: 'Business',
                        ),
                        SidebarTabParent(
                          index: 2,
                          icon: HeroIcons.dotsHorizontal,
                          name: 'Transaction',
                        ),
                        SidebarTabParent(
                          index: 3,
                          icon: HeroIcons.dotsHorizontal,
                          name: 'Settlement',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Divider(
                  height: 1,
                  color: ThemeColors.coolgray300,
                ),
              ),
              SizedBox(
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Column(
                      children: [
                        SidebarTabParent(
                          index: 4,
                          icon: HeroIcons.documentText,
                          name: 'Documentation',
                        ),
                        SidebarTabParent(
                          index: 5,
                          icon: HeroIcons.dotsHorizontal,
                          name: 'More',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 86),
              Container(
                height: 72,
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Copyright',
                  style: ThemeTextRegular.xxs
                      .apply(color: ThemeColors.warmgray500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
