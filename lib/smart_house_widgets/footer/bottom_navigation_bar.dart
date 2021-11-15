import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

import 'fab_2.dart';

class BottomNavBar extends StatefulWidget {
  void Function(int)? firstIconFunction;
  void Function(int)? secondIconFunction;
  void Function(int)? thirdIconFunction;

  BottomNavBar({
    required this.firstIconFunction,
    required this.secondIconFunction,
    required this.thirdIconFunction,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: ThemeAdditional.dropShadow1),
      child: BottomNavigationBar(
        elevation: 0,
        unselectedLabelStyle:
            ThemeTextRegular.notoR10.apply(color: ThemeColors.gray4),
        selectedLabelStyle:
            ThemeTextRegular.notoR10.apply(color: ThemeColors.gray4),
        unselectedItemColor: ThemeColors.gray4,
        selectedItemColor: ThemeColors.gray4,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        backgroundColor: ThemeColors.white,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            label: '전월세+확정일자',
            icon: CustomIcon(
              imagePath: 'assets/icons/list_doc_gray_ic.png',
              height: 36,
            ),
          ),
          BottomNavigationBarItem(
            label: '마이페이지',
            icon: CustomIcon(
              imagePath: 'assets/icons/user_gray_ic.png',
              height: 36,
            ),
          )
        ],
      ),
    );
  }

  _onTap(index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        widget.firstIconFunction!(index);
        break;
      case 1:
        widget.secondIconFunction!(index);
        break;
      case 2:
        widget.thirdIconFunction!(index);
        break;
    }
  }
}

Widget smartHouseBNBStory() {
  return Scaffold(
    body: Container(
        child: Text('Check bottom navigation bar!'),
        alignment: Alignment.center),
    floatingActionButton: Fab2(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomNavBar(
      firstIconFunction: (index) {},
      secondIconFunction: (index) {},
      thirdIconFunction: (index) {},
    ),
  );
}
