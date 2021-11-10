import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // boxShadow: ThemeAdditional.dropShadow1,
          borderRadius:
              BorderRadius.circular((MediaQuery.of(context).size.width / 2)),
          border: Border.all(width: 7, color: ThemeColors.white)),
      margin: EdgeInsets.only(top: 35.0),
      child: CircleButton(
        child: CustomIcon(
          imagePath: 'assets/icons/home_normal_ic.png',
          height: 25,
        ),
        onPressed: () async {},
      ),
    );
  }
}
