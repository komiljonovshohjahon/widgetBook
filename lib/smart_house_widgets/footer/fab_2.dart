import 'package:flutter/material.dart';
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class Fab2 extends StatefulWidget {
  @override
  _Fab2State createState() => _Fab2State();
}

class _Fab2State extends State<Fab2> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 47.7;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: size.width,
      height: size.height,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              IgnorePointer(
                child: Container(
                  color: Colors.transparent,
                  height: 150.0,
                  width: 300.0,
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    degOneTranslationAnimation.value * 100),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onClick: () {
                      print('First Button');
                    },
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(225),
                    degTwoTranslationAnimation.value * 100),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degTwoTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.black,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onClick: () {
                      print('Second button');
                    },
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(180),
                    degThreeTranslationAnimation.value * 100),
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value))
                    ..scale(degThreeTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.orangeAccent,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onClick: () {
                      print('Third Button');
                    },
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.rotationZ(
                    getRadiansFromDegree(rotationAnimation.value)),
                alignment: Alignment.center,
                child: CircleButton(
                  child: CustomIcon(
                    imagePath: animationController.isDismissed
                        ? 'assets/icons/home_normal_180_rotated_ic.png'
                        : 'assets/icons/camera_ic.png',
                    height: 25,
                  ),
                  onPressed: () {
                    if (animationController.isCompleted) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                  },
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final void Function()? onClick;

  CircularButton(
      {required this.color,
      required this.width,
      required this.height,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
