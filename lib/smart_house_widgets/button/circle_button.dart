import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class CircleButton extends StatelessWidget {
  Widget child;
  void Function()? onPressed;
  CircleButton({required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: ThemeAdditional.blueGradient,
        shape: BoxShape.circle,
        boxShadow: ThemeAdditional.dropShadow2Fab,
      ),
      child: ElevatedButton(
        style: circleButtonTheme(),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
