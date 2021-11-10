import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class InputLabel extends StatelessWidget {
  String label;
  InputLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        textAlign: TextAlign.start,
        style: ThemeTextMedium.notoM13,
      ),
    );
  }
}
