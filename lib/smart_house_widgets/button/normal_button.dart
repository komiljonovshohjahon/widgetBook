import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class NormalButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  NormalButton({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: normalButtonTheme(),
      onPressed: onPressed,
      child: SizedText(
        text: text,
        textStyle: ThemeTextRegular.notoR16.copyWith(
          color: ThemeColors.white,
        ),
      ),
    );
  }
}

Widget smartHouseButtonStory() {
  return SpacedColumn(
    verticalSpace: 10,
    children: [
      ExpandedButton(
        text: 'Expanded button',
        onPressed: () {},
      ),
      MainButton(
        text: 'Main button',
        onPressed: () {},
      ),
      NormalButton(
        text: 'Normal button',
        onPressed: () {},
      ),
      DenseButton(
        text: 'Dense button',
        onPressed: () {},
      ),
      SmallButton(
        text: 'Small button',
        onPressed: () {},
      ),
      CircleButton(
        child: Container(),
        onPressed: () {},
      ),
      TextButtonSec(
        text: 'Text button',
        onPressed: () {},
      ),
    ],
  );
}
