import 'dart:core';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

//Instance
WidgetbookUseCase yolletWebUsecase(
    {required String name, required Widget widget}) {
  return WidgetbookUseCase(
      name: "$name Instance",
      builder: (_) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: widget,
          ));
}
