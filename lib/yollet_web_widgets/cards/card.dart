import 'package:flutter/material.dart';
import 'package:widgetbook_2/base/theme_additional.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/widgets/buttons/button_variants.dart';
import 'package:widgetbook_2/widgets/buttons/default_button.dart';
import 'package:widgetbook_2/widgets/cards/cards_container.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Cards Container', type: CardsContainer)
Widget defaultCardsContainerStory(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width,
    height: height,
    color: ThemeColors.blue100,
    padding: EdgeInsets.all(16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultCard(
          bodyName: 'DefaultCard',
          headName: 'DefaultCard',
          childName: 'DefaultCard',
        ),
        SizedBox(
          width: 20,
        ),
        CardsContainer(
          cardsList: [
            DefaultCard(
              bodyName: 'Test1',
              headName: 'Test1',
              childName: 'Test1',
            ),
            DefaultCard(
              bodyName: 'Test2',
              headName: 'Test2',
              childName: 'Test2',
            ),
            DefaultCard(
              bodyName: 'Test3',
              headName: 'Test3',
              childName: 'Test3',
            ),
          ],
        )
      ],
    ),
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
