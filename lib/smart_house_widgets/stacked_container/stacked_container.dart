import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class StackedContainerSmall extends StatelessWidget {
  Widget child;

  StackedContainerSmall({required this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.blueGradient_s.withOpacity(0.08),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.only(left: 12, right: 12, top: 7),
          width: 300,
          height: 130,
        ),
        Container(
          padding: EdgeInsets.only(right: 8, left: 20, top: 29, bottom: 22),
          decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: 324,
          height: 130,
          child: child,
        ),
      ],
    );
  }
}

class StackedContainerLarge extends StatelessWidget {
  Widget child;

  StackedContainerLarge({required this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.blueGradient_s.withOpacity(0.08),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.only(left: 12, right: 12, top: 3),
          width: 300,
          height: 134,
        ),
        Container(
          padding: EdgeInsets.only(right: 13, left: 11, top: 21, bottom: 13),
          decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: 324,
          height: 126,
          child: child,
        ),
      ],
    );
  }
}

class StackedContainerTiny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.blueGradient_s.withOpacity(0.08),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.only(left: 13, right: 12, top: 7),
          width: 131,
          height: 99,
        ),
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: 156,
          height: 99,
        ),
      ],
    );
  }
}

class StackedContainerSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.blueGradient_s.withOpacity(0.08),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.only(top: 7),
          width: 220,
          height: 180,
        ),
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: 220,
          height: 180,
        ),
      ],
    );
  }
}

class StackedContainerLargeColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ThemeColors.blue.withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.only(top: 267, left: 12, right: 8),
              width: 300,
              height: 130,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: ThemeAdditional.blueGradientReverse,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.only(top: 261),
              width: 320,
              height: 132,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 322,
          height: 320,
        ),
      ],
    );
  }
}

class StackedContainerBig extends StatelessWidget {
  Widget child;

  StackedContainerBig({required this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.blueGradient_s.withOpacity(0.08),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.only(left: 12, right: 12, top: 3),
          width: 300,
          height: 240,
        ),
        Container(
          padding: EdgeInsets.only(right: 13, left: 11, top: 21, bottom: 13),
          decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          width: 324,
          height: 240,
          child: child,
        ),
      ],
    );
  }
}
