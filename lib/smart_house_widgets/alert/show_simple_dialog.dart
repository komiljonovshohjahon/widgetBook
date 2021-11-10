import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

showSimpleDialog(BuildContext context,
    {void Function()? onLeftPress,
    void Function()? onRightPress,
    required String text,
    bool barrierDismissible = true}) {
  return showDialog(
    context: context,
    routeSettings: RouteSettings(name: 'Simple Dialog'),
    barrierDismissible: barrierDismissible,
    // barrierColor: ThemeColors.popupBg.withOpacity(0.8),
    builder: (context) {
      return PopupLayout(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalButton(
                text: '버튼1',
                onPressed: onLeftPress,
              ),
              NormalButton(
                text: '버튼2sdfashdsjah',
                onPressed: onRightPress,
              )
            ],
          ),
        ],
        title: Text(
          text,
          style: ThemeTextMedium.notoM15,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      );
    },
  );
}
