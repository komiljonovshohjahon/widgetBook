import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_2/widgets/buttons/default_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookTheme.dark()
ThemeData darkTheme() => ThemeData.dark();
ThemeData lightTheme() => ThemeData.light();

@WidgetbookApp(name: 'Example App', devices: [
  Device(
      name: 'Yollet Web',
      resolution: Resolution(
          nativeSize: DeviceSize(width: 1440, height: 1000), scaleFactor: 1),
      type: DeviceType.desktop)
])
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
    );
  }
}
