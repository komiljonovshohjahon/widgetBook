import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../yollet_web_widget_exporter.dart';

class SidebarTabParent extends StatefulWidget {
  HeroIcons? icon;
  int? badgeCount;
  int index;
  double? height;
  bool? collapsed;
  String name;

  SidebarTabParent({
    Key? key,
    this.icon,
    required this.index,
    required this.name,
    this.collapsed = false,
    this.height = 40,
    this.badgeCount,
  }) : super(key: key);

  @override
  State<SidebarTabParent> createState() => _SidebarTabParentState();
}

class _SidebarTabParentState extends State<SidebarTabParent>
    with TickerProviderStateMixin {
  bool isCollapsed = false;

  late Animation _arrowAnimation;
  late AnimationController _arrowAnimationController;
  Color textColor = ThemeColors.coolgray500;
  Color bgColor = ThemeColors.white;
  Color textColorActive = ThemeColors.white;
  Color bgColorActive = ThemeColors.orange500;
  Color textColorInActive = ThemeColors.coolgray500;
  Color bgColorInActive = ThemeColors.white;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _arrowAnimation = Tween(
      begin: math.pi * 1.5,
      end: 0.0,
    ).animate(_arrowAnimationController);
    if (widget.collapsed == true) {
      _arrowAnimationController.isCompleted
          ? _arrowAnimationController.reverse()
          : _arrowAnimationController.forward();
      isCollapsed = true;
      bgColor = bgColorActive;
      textColor = textColorActive;
    } else {
      textColor = textColorInActive;
      bgColor = bgColorInActive;
    }
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // widget.state.navigationState.history.last;

    isCollapsed = false;
    textColor = textColorInActive;
    bgColor = bgColorInActive;
    _arrowAnimationController.isCompleted
        ? _arrowAnimationController.reverse()
        : _arrowAnimationController.forward();

    return GestureDetector(
      onTapUp: (details) {
        _arrowAnimationController.isCompleted
            ? _arrowAnimationController.reverse()
            : _arrowAnimationController.forward();

        setState(() {
          isCollapsed = !isCollapsed;
          if (isCollapsed) {
            bgColor = bgColorActive;
            textColor = textColorActive;
          } else {
            textColor = textColorInActive;
            bgColor = bgColorInActive;
          }
        });
      },
      child: Column(children: [
        _buildMain(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.only(top: 10),
          height: isCollapsed ? widget.height! * 2.toDouble() + (2 * 16) : 0,
          child: Column(
            children: _buildCollapseActions(),
          ),
        )
      ]),
    );
  }

  List<Widget> _buildCollapseActions() {
    List<Widget> list = [];
    list.add(SidebarTabChild());
    list.add(const SizedBox(
      height: 10,
    ));
    return list;
  }

  Widget _buildMain() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: bgColor,
      ),
      height: widget.height,
      child: Row(
        children: [
          if (widget.icon != null)
            HeroIcon(
              widget.icon!,
              size: 24,
              color: textColor,
            ),
          if (widget.icon != null)
            const SizedBox(
              width: 8,
            ),
          Expanded(
            flex: 1,
            child: Text(
              widget.name.toString(),
              style: ThemeTextRegular.base.apply(color: textColor),
            ),
          ),
          if (widget.badgeCount != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ThemeColors.coolgray100,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                widget.badgeCount!.toString(),
                style: ThemeTextRegular.sm.apply(color: textColor),
              ),
            ),
          AnimatedBuilder(
            animation: _arrowAnimationController,
            builder: (context, child) => Transform.rotate(
              angle: _arrowAnimation.value,
              child: Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
