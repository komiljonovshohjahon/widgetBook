import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class MainButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  MainButton({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: mainButtonTheme(),
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
