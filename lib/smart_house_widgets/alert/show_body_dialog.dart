
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

showBodyDialog(
  BuildContext context, {
  void Function()? onPress,
  String? text,
  List<Widget>? bodyChildren,
  bool barrierDismissible = true,
  Color? color = ThemeColors.white,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    routeSettings: RouteSettings(name: 'Body Dialog'),
    builder: (context) {
      return SimpleDialog(
        backgroundColor: color,
        children: [
          bodyChildren == null
              ? ExpandedButton(
                  text: '버튼1',
                  onPressed: onPress,
                )
              : SizedBox(),
        ],
        title: Column(
          children: [
            text != null
                ? Text(
                    text,
                    style: ThemeTextMedium.notoM15,
                  )
                : SizedBox(),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: bodyChildren ??
                  [
                    NormalButton(text: 'Button1'),
                    NormalButton(text: 'Button2')
                  ],
            )
          ],
        ),
        contentPadding: EdgeInsets.zero,
        titlePadding:
            text != null ? EdgeInsets.only(top: 50) : EdgeInsets.zero,
        insetPadding: EdgeInsets.symmetric(horizontal: 25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
      );
    },
  );
}
