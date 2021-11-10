import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

AppBar header({bool? isLarge = false, bool? noBackButton = false}) {
  return AppBar(
    bottom: noBackButton!
        ? BottomWidgetsNoBack() as PreferredSizeWidget
        : BottomWidgets(),
    automaticallyImplyLeading: false,
    toolbarHeight: isLarge! ? 160 : null,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: ThemeAdditional.blueGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
  );
}

class BottomWidgets extends StatelessWidget implements PreferredSizeWidget {
  const BottomWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: CustomIcon(
                imagePath: 'assets/icons/arrow_left_white_ic.png', height: 36),
            onPressed: () {},
          ),
          CustomIcon(imagePath: 'assets/icons/appbar_title_ic.png', height: 28),
          IconButton(
            padding: EdgeInsets.zero,
            icon: CustomIcon(imagePath: 'assets/icons/menu_ic.png', height: 36),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

class BottomWidgetsNoBack extends StatelessWidget
    implements PreferredSizeWidget {
  const BottomWidgetsNoBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          CustomIcon(imagePath: 'assets/icons/appbar_title_ic.png', height: 28),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: CustomIcon(
                    imagePath: 'assets/icons/menu_ic.png', height: 36),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
