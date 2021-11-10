import 'package:flutter/material.dart';

class PopupLayout extends StatelessWidget {
  List<Widget> children;
  Widget title;
  double? horizontalPadding;
  PopupLayout(
      {required this.children,
      required this.title,
      this.horizontalPadding = 0.0});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding:
          const EdgeInsets.only(bottom: 30, left: 30, right: 30, top: 75),
      titlePadding: EdgeInsets.only(
          top: 75, left: horizontalPadding!, right: horizontalPadding!),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 0,
      children: children,
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      title: title,
    );
  }
}
