import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class TextButtonSec extends StatelessWidget {
  String text;
  void Function()? onPressed;
  TextButtonSec({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: textButtonTheme(),
      onPressed: onPressed,
      child: SizedText(text: text, textStyle: ThemeTextRegular.notoR13),
    );
  }
}
