import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class SizedText extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final TextStyle? textStyle;
  final bool useLocaleText;
  final TextOverflow overflow;
  final TextAlign textAlign;

  const SizedText({
    this.width,
    this.height,
    required this.text,
    this.textStyle,
    this.useLocaleText = true,
    this.overflow = TextOverflow.visible,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Text(
        text,
        style: textStyle,
        textAlign: textAlign,
      ),
    );
  }
}
