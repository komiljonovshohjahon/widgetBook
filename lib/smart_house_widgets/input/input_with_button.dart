import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class InputWithButton extends StatelessWidget {
  void Function()? onPressed;
  String? hint;
  String? Function(String?)? validator;
  String buttonText;
  TextEditingController? controller;

  InputWithButton(
      {this.validator,
      this.onPressed,
      this.hint,
      required this.buttonText,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 3,
            child: BasicInput(
              controller: controller,
              validator: validator,
              hintText: hint,
            )),
        SizedBox(
          width: 8,
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: DenseButton(
                text: buttonText,
                onPressed: onPressed,
              ),
            ))
      ],
    );
  }
}
