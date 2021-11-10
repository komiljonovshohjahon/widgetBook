import 'template.dart';

class ThemeAdditional {
  static const blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ThemeColors.blueGradient_s,
      ThemeColors.blueGradient_e,
    ],
  );
  static const blueGradientReverse = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ThemeColors.blueGradient_e,
      ThemeColors.blueGradient_s,
    ],
  );

  static List<BoxShadow> dropShadow1 = [
    BoxShadow(
        offset: const Offset(0, -2),
        blurRadius: 10,
        spreadRadius: 0,
        color: ThemeColors.blueGradient_s.withOpacity(0.102))
  ];
  static List<BoxShadow> dropShadow2Fab = [
    BoxShadow(
        offset: const Offset(0, 3),
        blurRadius: 10,
        spreadRadius: 0,
        color: ThemeColors.blueGradient_s.withOpacity(0.302))
  ];
}
