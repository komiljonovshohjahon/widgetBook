import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hovering/hovering.dart';
import 'package:widgetbook_2/base/theme_additional.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_size_style.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/widgets/buttons/button_variants.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class DefaultButton extends StatelessWidget {
  HeroIcons? icon;
  Color? textColor;
  String text;
  Color? bgColor;
  bool? iconRightSide;
  VoidCallback? onPressed;
  ButtonSize? sizeOfButton;
  ButtonVariant? variant;
  double? buttonHeight = ThemeSizeStyle.defaultButtonXSHeight;
  double? iconSize;
  EdgeInsetsGeometry? padding;
  List<BoxShadow>? shadow;
  Border? border;
  HeroIcon? iconButton;
  bool? isExpanded;
  bool? disabled;
  bool? sortableTableOpened;
  bool? isSortableTable;

  DefaultButton({
    Key? key,
    required this.text,
    this.sizeOfButton = ButtonSize.XS,
    this.variant = ButtonVariant.PRIMARY,
    this.icon,
    required this.onPressed,
    this.iconRightSide = false,
    this.isExpanded = false,
    this.disabled = false,
    this.iconButton,
    this.sortableTableOpened = false,
    this.isSortableTable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getSize();
    _getVariant();

    if (!isExpanded!) {
      return Row(
        children: [
          InkWell(
            radius: 6,
            onTap: !disabled! ? onPressed : null,
            child: HoverContainer(
              cursor: MouseCursor.defer,
              height: buttonHeight,
              decoration: BoxDecoration(
                  boxShadow: shadow ?? [],
                  color: disabled! ? bgColor!.withOpacity(0.5) : bgColor!,
                  border: border ??
                      Border.all(width: 0, color: ThemeColors.transparent),
                  borderRadius: BorderRadius.circular(6)),
              hoverDecoration: BoxDecoration(
                  boxShadow: shadow ?? [],
                  color: bgColor!
                      .withOpacity(variant == ButtonVariant.LINK ? 0.0 : 0.8),
                  border: border ??
                      Border.all(width: 0, color: ThemeColors.transparent),
                  borderRadius: BorderRadius.circular(6)),
              padding: padding!,
              child: isSortableTable == false
                  ? iconButton != null
                      ? iconButton
                      : !iconRightSide!
                          ? Row(
                              children: [
                                if (icon != null)
                                  HeroIcon(
                                    icon!,
                                    size: iconSize,
                                    color: textColor,
                                  ),
                                if (icon != null)
                                  const SizedBox(
                                    width: 5,
                                  ),
                                Text(text.toString(),
                                    style: ThemeTextSemiBold.sm.apply(
                                        color: disabled!
                                            ? textColor!.withOpacity(0.5)
                                            : textColor)),
                              ],
                            )
                          : Row(
                              children: [
                                Text(text.toString(),
                                    style: ThemeTextSemiBold.sm.apply(
                                        color: disabled!
                                            ? textColor!.withOpacity(0.5)
                                            : textColor)),
                                if (icon != null)
                                  const SizedBox(
                                    width: 5,
                                  ),
                                if (icon != null)
                                  HeroIcon(
                                    icon!,
                                    size: iconSize,
                                    color: textColor,
                                  ),
                              ],
                            )
                  : Row(
                      children: [
                        if (icon != null)
                          HeroIcon(
                            icon!,
                            size: iconSize,
                            color: textColor,
                          ),
                        if (icon != null)
                          const SizedBox(
                            width: 5,
                          ),
                        Text(text.toString(),
                            style: ThemeTextSemiBold.sm.apply(
                                color: disabled!
                                    ? textColor!.withOpacity(0.5)
                                    : textColor)),
                        const SizedBox(
                          width: 5,
                        ),
                        if (sortableTableOpened == true)
                          HeroIcon(
                            HeroIcons.chevronUp,
                            size: iconSize,
                            color: textColor,
                          ),
                        if (sortableTableOpened == false)
                          HeroIcon(
                            HeroIcons.chevronDown,
                            size: iconSize,
                            color: textColor,
                          ),
                      ],
                    ),
            ),
          ),
        ],
      );
    } else {
      return InkWell(
        radius: 6,
        onTap: !disabled! ? onPressed : null,
        child: HoverContainer(
          cursor: MouseCursor.defer,
          height: buttonHeight,
          decoration: BoxDecoration(
              boxShadow: shadow ?? [],
              color: disabled! ? bgColor!.withOpacity(0.5) : bgColor!,
              border: border ??
                  Border.all(width: 0, color: ThemeColors.transparent),
              borderRadius: BorderRadius.circular(6)),
          hoverDecoration: BoxDecoration(
              boxShadow: shadow ?? [],
              color: bgColor!
                  .withOpacity(variant == ButtonVariant.LINK ? 0.0 : 0.8),
              border: border ??
                  Border.all(width: 0, color: ThemeColors.transparent),
              borderRadius: BorderRadius.circular(6)),
          padding: padding!,
          child: iconButton != null
              ? iconButton
              : !iconRightSide!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          HeroIcon(
                            icon!,
                            size: iconSize,
                            color: disabled!
                                ? textColor!.withOpacity(0.5)
                                : textColor,
                          ),
                        if (icon != null)
                          const SizedBox(
                            width: 5,
                          ),
                        Text(text.toString(),
                            style: ThemeTextSemiBold.sm.apply(
                                color: disabled!
                                    ? textColor!.withOpacity(0.5)
                                    : textColor)),
                      ],
                    )
                  : Row(
                      children: [
                        Text(text.toString(),
                            style: ThemeTextSemiBold.sm.apply(
                                color: disabled!
                                    ? textColor!.withOpacity(0.5)
                                    : textColor)),
                        if (icon != null)
                          const SizedBox(
                            width: 5,
                          ),
                        if (icon != null)
                          HeroIcon(
                            icon!,
                            size: iconSize,
                            color: textColor,
                          ),
                      ],
                    ),
        ),
      );
    }
  }

  _getSize() {
    switch (sizeOfButton) {
      case ButtonSize.S:
        buttonHeight = 36;
        padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
        iconSize = ThemeSizeStyle.defaultButtonIconSize1;
        break;
      case ButtonSize.M:
        buttonHeight = 40;
        padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0);
        iconSize = ThemeSizeStyle.defaultButtonIconSize1;
        break;
      case ButtonSize.L:
        buttonHeight = 44;
        padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
        iconSize = ThemeSizeStyle.defaultButtonIconSize2;
        break;
      case ButtonSize.XL:
        buttonHeight = 52;
        padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);
        iconSize = ThemeSizeStyle.defaultButtonIconSize2;
        break;
      default:
        buttonHeight = 30;
        padding = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0);
        iconSize = ThemeSizeStyle.defaultButtonIconSize1;
        break;
    }
  }

  _getVariant() {
    switch (variant) {
      case ButtonVariant.SECONDARY:
        bgColor = ThemeColors.orange100;
        textColor = ThemeColors.orange500;
        break;
      case ButtonVariant.GHOST:
        bgColor = ThemeColors.white;
        textColor = ThemeColors.gray600;
        shadow = ThemeShadows.shadowSm;
        border = Border.all(width: 1, color: ThemeColors.coolgray300);
        break;
      case ButtonVariant.LINK:
        bgColor = ThemeColors.transparent;
        textColor = ThemeColors.orange500;
        break;
      default:
        bgColor = ThemeColors.orange500;
        textColor = ThemeColors.white;
        break;
    }
  }
}

@WidgetbookStory(name: 'Default Button', type: DefaultButton)
Widget defaultDefaultButtonStory(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width,
    height: height,
    color: ThemeColors.blue100,
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Row(
          children: [
            DefaultButton(
              onPressed: () {},
              text: 'Primary Button',
              sizeOfButton: ButtonSize.S,
              variant: ButtonVariant.PRIMARY,
            ),
            SizedBox(
              width: 20,
            ),
            DefaultButton(
              onPressed: () {},
              text: 'Primary Button',
              sizeOfButton: ButtonSize.M,
              variant: ButtonVariant.PRIMARY,
            ),
            SizedBox(
              width: 20,
            ),
            DefaultButton(
              onPressed: () {},
              text: 'Primary Button',
              sizeOfButton: ButtonSize.L,
              variant: ButtonVariant.PRIMARY,
            ),
            SizedBox(
              width: 20,
            ),
            DefaultButton(
              onPressed: () {},
              text: 'Primary Button',
              sizeOfButton: ButtonSize.XL,
              variant: ButtonVariant.PRIMARY,
            ),
            SizedBox(
              width: 20,
            ),
            DefaultButton(
              onPressed: () {},
              text: 'Primary Button',
              sizeOfButton: ButtonSize.XS,
              variant: ButtonVariant.PRIMARY,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        DefaultButton(
          onPressed: () {},
          text: 'Secondary Button',
          variant: ButtonVariant.SECONDARY,
        ),
        SizedBox(
          height: 20,
        ),
        DefaultButton(
          onPressed: () {},
          text: 'Ghost button',
          variant: ButtonVariant.GHOST,
        ),
        SizedBox(
          height: 20,
        ),
        DefaultButton(
          onPressed: () {},
          text: 'Link Button',
          variant: ButtonVariant.LINK,
        ),
      ],
    ),
  );
}
