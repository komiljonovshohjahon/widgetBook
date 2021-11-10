
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class CustomIcon extends StatelessWidget {
  String imagePath;
  double height;
  void Function()? onTap;
  CustomIcon({required this.imagePath, required this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        height: height,
      ),
    );
  }
}
