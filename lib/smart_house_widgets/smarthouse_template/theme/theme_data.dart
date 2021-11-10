import 'package:flutter/services.dart';
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class MainTheme {
  static ThemeData get mainThemeBlue {
    return ThemeData(
        scaffoldBackgroundColor: ThemeColors.bgBasic,
        appBarTheme: _appBarTheme(),
        bottomNavigationBarTheme: _bottomNavTheme(),
        primaryTextTheme: _primaryTextTheme(),
        popupMenuTheme: PopupMenuThemeData());
  }
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
      elevation: 0,
      toolbarHeight: 84,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))));
}

TextTheme _primaryTextTheme() {
  return TextTheme();
}

BottomNavigationBarThemeData _bottomNavTheme() {
  return BottomNavigationBarThemeData();
}

ButtonStyle expandedButtonTheme() {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    textStyle: MaterialStateProperty.all(ThemeTextRegular.notoR16),
    foregroundColor: MaterialStateProperty.all(ThemeColors.white),
    maximumSize: MaterialStateProperty.all(Size(320, 50)),
    minimumSize: MaterialStateProperty.all(Size(320, 50)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return ThemeColors.gray1;
        return ThemeColors.blue;
      },
    ),
  );
}

ButtonStyle normalButtonTheme() {
  return ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    elevation: MaterialStateProperty.all(0),
    textStyle: MaterialStateProperty.all(ThemeTextRegular.notoR16),
    foregroundColor: MaterialStateProperty.all(ThemeColors.white),
    maximumSize: MaterialStateProperty.all(Size(112, 50)),
    minimumSize: MaterialStateProperty.all(Size(112, 50)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return ThemeColors.gray1;
        return ThemeColors.blue;
      },
    ),
  );
}

ButtonStyle mainButtonTheme() {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    textStyle: MaterialStateProperty.all(ThemeTextRegular.notoR16),
    foregroundColor: MaterialStateProperty.all(ThemeColors.white),
    maximumSize: MaterialStateProperty.all(Size(206, 50)),
    minimumSize: MaterialStateProperty.all(Size(206, 50)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return ThemeColors.gray1;
        return ThemeColors.blue;
      },
    ),
  );
}

ButtonStyle smallButtonTheme() {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    textStyle: MaterialStateProperty.all(ThemeTextRegular.notoR13),
    foregroundColor: MaterialStateProperty.all(ThemeColors.white),
    maximumSize: MaterialStateProperty.all(Size(50, 28)),
    minimumSize: MaterialStateProperty.all(Size(50, 28)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return ThemeColors.gray1;
        return ThemeColors.blue;
      },
    ),
  );
}

ButtonStyle denseButtonTheme() {
  return ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.all(ThemeTextRegular.notoR13),
      foregroundColor: MaterialStateProperty.all(ThemeColors.white),
      maximumSize: MaterialStateProperty.all(Size(78, 39)),
      minimumSize: MaterialStateProperty.all(Size(78, 39)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)))),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return ThemeColors.gray1;
        return ThemeColors.blue;
      }));
}

ButtonStyle circleButtonTheme() {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    maximumSize: MaterialStateProperty.all(Size(64, 64)),
    minimumSize: MaterialStateProperty.all(Size(64, 64)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular((64 / 2))))),
    textStyle: MaterialStateProperty.all(ThemeTextRegular.notoR16),
    foregroundColor: MaterialStateProperty.all(ThemeColors.white),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return ThemeColors.gray1;
        return ThemeColors.transparent;
      },
    ),
  );
}

ButtonStyle textButtonTheme() {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    textStyle: MaterialStateProperty.all(ThemeTextRegular.notoR13),
    foregroundColor: MaterialStateProperty.all(ThemeColors.black),
    overlayColor: MaterialStateProperty.all(ThemeColors.gray2),
  );
}
