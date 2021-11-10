import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Card', type: Card)
Widget defaultCardStory() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DefaultCard(
        bodyName: 'Card description',
        headName: 'Card name',
        childName: '0.1%',
        onRemove: () {},
      ),
    ],
  );
}

class DefaultCard extends StatelessWidget {
  String headName;
  String bodyName;
  String childName;
  String rightButtonText;
  Color headNameColor;
  Color bodyNameColor;
  Color backgroundColor;
  bool isButton;
  void Function()? onClick;
  void Function()? onRemove;

  DefaultCard({
    Key? key,
    required this.headName,
    required this.bodyName,
    required this.childName,
    this.rightButtonText = 'remove',
    this.headNameColor = ThemeColors.gray700,
    this.bodyNameColor = ThemeColors.coolgray500,
    this.backgroundColor = ThemeColors.white,
    this.isButton = true,
    this.onClick,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 410.0,
        height: 138.0,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: ThemeShadows.shadow),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headName,
              style: ThemeTextSemiBold.lg.apply(color: headNameColor),
            ),
            Text(
              bodyName,
              style: ThemeTextRegular.sm.apply(color: bodyNameColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isButton)
                  DefaultButton(
                    text: childName.toString(),
                    onPressed: () {},
                    variant: ButtonVariant.SECONDARY,
                    sizeOfButton: ButtonSize.XS,
                  ),
                if (!isButton)
                  Text(
                    childName,
                    style: ThemeTextRegular.base
                        .apply(color: ThemeColors.coolgray500),
                  ),
                if (onRemove != null)
                  DefaultButton(
                    text: rightButtonText,
                    onPressed: onRemove,
                    variant: ButtonVariant.GHOST,
                    sizeOfButton: ButtonSize.XS,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
