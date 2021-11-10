import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class CustomTabController extends StatefulWidget {
  List<Widget> children;
  List<String> tabNames;
  List<double>? viewHeights;
  int initIndex;

  CustomTabController(
      {required this.children,
      required this.tabNames,
      this.viewHeights,
      required this.initIndex});

  @override
  _CustomTabControllerState createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late TabController _tabController = TabController(
      vsync: this,
      length: widget.children.length,
      initialIndex: widget.initIndex);

  @override
  void initState() {
    super.initState();
    setState(() {
      currentIndex = widget.initIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initIndex,
      length: widget.children.length,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 40),
              child: TabBar(
                  controller: _tabController,
                  onTap: (value) {
                    setState(() {
                      currentIndex = _tabController.index;
                    });
                  },
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: Colors.transparent,
                  tabs: tabChildren(
                      currentIndex: currentIndex, tabNames: widget.tabNames))),
          SizedBox(
              height: widget.viewHeights != null
                  ? widget.viewHeights![currentIndex]
                  : MediaQuery.of(context).size.height,
              child: _tabView()),
        ],
      ),
    );
  }

  Widget _tabView() {
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: widget.children,
    );
  }
}

List<Tab> tabChildren(
    {required int currentIndex, required List<String> tabNames}) {
  List<Tab> list = [];
  TabLocation location = TabLocation.left;
  for (int i = 0; i < tabNames.length; i++) {
    if (tabNames.first == tabNames[i]) {
      location = TabLocation.left;
    } else if (tabNames.last == tabNames[i]) {
      location = TabLocation.right;
    }
    list.add(Tab(
      height: 50,
      child: Child(
        index: i,
        title: tabNames[i],
        currentIndex: currentIndex,
        tabLocation: location,
      ),
    ));
  }

  return list;
}

class Child extends StatelessWidget {
  final TabLocation tabLocation;
  final int index;
  int currentIndex;
  String title;
  Child(
      {required this.tabLocation,
      required this.index,
      required this.currentIndex,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: ThemeColors.white,
          borderRadius: tabLocation == TabLocation.left
              ? BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
              : BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
          border: Border.all(width: 1, color: ThemeColors.gray2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          currentIndex == index
              ? CustomIcon(imagePath: 'assets/icons/checked_ic.png', height: 24)
              : CustomIcon(
                  imagePath: 'assets/icons/unchecked_ic.png', height: 24),
          SizedBox(
            width: 4,
          ),
          Text(
            title,
            style: ThemeTextMedium.notoM15.copyWith(
                color: currentIndex == index
                    ? ThemeColors.black
                    : ThemeColors.gray1),
          ),
        ],
      ),
    );
  }
}

enum TabLocation { right, left }
