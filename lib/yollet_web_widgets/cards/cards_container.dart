import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class CardsContainer extends StatefulWidget {
  List<DefaultCard>? cardsList;
  String? methodName;
  bool? addMore;
  void Function()? addClick;
  CardsContainer({
    Key? key,
    this.cardsList,
    this.methodName = 'payment_method',
    this.addMore = true,
    this.addClick,
  }) : super(key: key);

  @override
  _CardsContainerState createState() => _CardsContainerState();
}

class _CardsContainerState extends State<CardsContainer> {
  int? activeElementIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 442,
        height: 579,
        decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFD1D5DB), //no colorTheme in figma
              width: 1.0,
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.methodName!,
                        style: ThemeTextRegular.xl.apply(
                          color: ThemeColors.black,
                        )),
                    if (widget.addMore!)
                      DefaultButton(
                        onPressed: widget.addClick,
                        text: 'add',
                        sizeOfButton: ButtonSize.M,
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 493,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (widget.cardsList != null)
                          const SizedBox(
                            height: 16,
                          ),
                        Column(
                          children: _listOfCards(widget.cardsList!),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> _listOfCards(List<DefaultCard> cardsList) {
    List<Widget> list = [];
    for (var i = 0; i < cardsList.length; i++) {
      if (i == activeElementIndex) {
        cardsList[activeElementIndex!].backgroundColor = ThemeColors.orange50;
      }
      list.add(cardsList[i]);
      list.add(const SizedBox(
        height: 24,
      ));
    }
    return list;
  }
}

@WidgetbookUseCase(name: 'Cards Container', type: CardsContainer)
Widget defaultCardsContainerStory() {
  return CardsContainer(
    methodName: "Payment Methods",
    cardsList: [
      DefaultCard(
        bodyName: 'Test 1',
        headName: 'Test 1',
        childName: 'Test 1',
      ),
      DefaultCard(
        bodyName: 'Test 2',
        headName: 'Test 2',
        childName: 'Test 2',
        onRemove: () {},
      ),
      DefaultCard(
        bodyName: 'Test 3',
        headName: 'Test 3',
        childName: 'Test 3',
      ),
    ],
  );
}
