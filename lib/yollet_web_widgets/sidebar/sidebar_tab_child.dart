import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class SidebarTabChild extends StatelessWidget {
  HeroIcons? icon;
  int? badgeCount;
  double? height;

  void get navigate {}

  SidebarTabChild({
    Key? key,
    this.icon,
    this.height = 36,
    this.badgeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = ThemeColors.coolgray500;

    Color bgColor = ThemeColors.white;
    return InkWell(
      onTap: () => navigate,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: bgColor,
        ),
        height: height,
        child: Row(
          children: [
            if (icon != null)
              HeroIcon(
                icon!,
                size: 24,
                color: textColor,
              ),
            if (icon != null)
              const SizedBox(
                width: 8,
              ),
            Expanded(
              flex: 1,
              child: Text(
                'Test',
                style: ThemeTextRegular.base.apply(color: textColor),
              ),
            ),
            if (badgeCount != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColors.coolgray100,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  badgeCount!.toString(),
                  style: ThemeTextRegular.sm.apply(color: textColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
