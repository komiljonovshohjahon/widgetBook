import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

showAlertDialog(BuildContext context,
    {void Function()? onPress,
    required String text,
    String? buttonText,
    double? horizontalPadding = 0.0,
    bool barrierDismissible = true}) {
  return showDialog(
    context: context,
    routeSettings: RouteSettings(name: 'Alert Dialog'),
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return PopupLayout(
        horizontalPadding: horizontalPadding,
        children: [
          ExpandedButton(
            text: buttonText ?? '버튼1',
            onPressed: onPress != null
                ? () {
                    onPress();
                  }
                : null,
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

Widget smartHouseAlertStory(BuildContext ctx) {
  return SpacedColumn(
    verticalSpace: 10,
    children: [
      ExpandedButton(
        text: 'Show alert dialog',
        onPressed: () {
          showAlertDialog(
            ctx,
            text: 'Alert Dialog',
            buttonText: 'Close popup',
            onPress: () {
              Navigator.pop(ctx);
            },
          );
        },
      ),
      ExpandedButton(
        text: 'Show body dialog',
        onPressed: () {
          showBodyDialog(
            ctx,
            color: Theme.of(ctx).backgroundColor,
            text: 'Body Dialog',
            onPress: () {
              Navigator.pop(ctx);
            },
          );
        },
      ),
      ExpandedButton(
        text: 'Show simple dialog',
        onPressed: () {
          showSimpleDialog(ctx, text: 'Body Dialog', onLeftPress: () {
            Navigator.pop(ctx);
          }, onRightPress: () {
            Navigator.pop(ctx);
          });
        },
      ),
    ],
  );
}
