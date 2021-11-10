import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class SmallButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  SmallButton({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: smallButtonTheme(),
      onPressed: onPressed,
      child: SizedText(
        text: text,
        textStyle: ThemeTextRegular.notoR13.copyWith(
          color: ThemeColors.white,
        ),
      ),
    );
  }
}
