import 'package:flutter/cupertino.dart';
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class DefaultBody extends StatelessWidget {
  Widget body;
  double? paddingTop;
  double? paddingHorizontal;
  double? paddingBottom;
  bool? showBottomAppBar;
  DefaultBody(this.body,
      {this.paddingTop = 0,
      this.paddingHorizontal = 18,
      this.paddingBottom = 0,
      this.showBottomAppBar = true});

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
      floatingActionButton: Visibility(
          visible: showBottomAppBar! ? showFab : showBottomAppBar!,
          child: CustomFloatingActionButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: showBottomAppBar!
          ? BottomNavBar(
              firstIconFunction: (index) {},
              secondIconFunction: (index) {},
              thirdIconFunction: (index) {},
            )
          : null,
      appBar: header(),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(
            top: paddingTop!,
            left: paddingHorizontal!,
            right: paddingHorizontal!,
            bottom: showBottomAppBar! ? 25 + paddingBottom! : paddingBottom!),
        children: [body],
      ),
    );
  }
}
