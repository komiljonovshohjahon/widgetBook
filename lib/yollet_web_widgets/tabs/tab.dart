import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/widgets/buttons/button_variants.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default Tab', type: DefaultTab)
Widget defaultDefaultTabStory(BuildContext context) {
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
        DefaultTab(
          text: 'Test Tab',
          sizeOfTab: ButtonSize.M,
          icon: HeroIcons.academicCap,
        ),
        SizedBox(
          height: 50,
        ),
        DefaultTab(
          text: 'Test Tab',
          isActive: true,
          sizeOfTab: ButtonSize.M,
          icon: HeroIcons.academicCap,
        ),
      ],
    ),
  );
}

class DefaultTab extends StatelessWidget {
  String text;
  ButtonSize? sizeOfTab;
  HeroIcons? icon;
  double iconSize = 16.0;
  double? tabHeight;
  bool? isActive = false;
  VoidCallback? onTap;
  double width = 150;

  DefaultTab({
    Key? key,
    this.text = 'tab',
    this.sizeOfTab = ButtonSize.M,
    this.icon,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getSize();

    return InkWell(
      onTap: onTap ?? null,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: tabHeight,
        width: width,
        decoration: BoxDecoration(
          color: isActive! ? ThemeColors.white : ThemeColors.transparent,
          border: isActive!
              ? const Border(
                  bottom: BorderSide(
                    color: ThemeColors.orange500,
                    width: 2.0,
                  ),
                )
              : const Border(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              HeroIcon(
                icon!,
                color:
                    isActive! ? ThemeColors.orange500 : ThemeColors.coolgray400,
                size: iconSize,
              ),
            if (icon != null) const SizedBox(width: 12.0),
            Text(
              text,
              style: ThemeTextRegular.sm.apply(
                color:
                    isActive! ? ThemeColors.orange500 : ThemeColors.coolgray400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getSize() {
    switch (sizeOfTab) {
      case ButtonSize.M:
        tabHeight = 52.0;
        width = 150;
        break;
      default:
        width = 150;

        tabHeight = 52.0;
        break;
    }
  }
}
