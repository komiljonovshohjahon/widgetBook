import 'package:flutter/services.dart';
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class BasicInput extends StatelessWidget {
  String? hintText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  String? errorText;
  TextInputFormatter? inputFormatter;

  BasicInput(
      {this.hintText,
      this.validator,
      this.controller,
      this.errorText,
      this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: ThemeTextRegular.notoR16,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeColors.white,
          hintText: hintText ?? 'Basic input',
          errorText: errorText,
          errorStyle: ThemeTextRegular.notoR13.copyWith(color: ThemeColors.red),
          hintStyle:
              ThemeTextRegular.notoR16.copyWith(color: ThemeColors.gray1),
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(width: 1, color: ThemeColors.gray2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(width: 1, color: ThemeColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(width: 1, color: ThemeColors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(width: 1, color: ThemeColors.purple)),
          constraints: BoxConstraints(maxWidth: 324),
        ));
  }
}

Widget smartHouseInputStory() {
  return SpacedColumn(
    verticalSpace: 20,
    children: [
      BasicInput(),
      PaymentInput(),
      InputButton(),
      InputWithButton(
        buttonText: 'Enter',
        onPressed: () {},
      ),
      SpacedColumn(
        children: [
          InputLabel(label: 'Basic input with label'),
          BasicInput(),
        ],
      )
    ],
  );
}
