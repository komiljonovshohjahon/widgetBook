import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class InputButton extends StatelessWidget {
  String? hintText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  bool? turnedOn;
  void Function()? onTap;
  InputButton(
      {this.hintText,
      this.validator,
      this.controller,
      this.turnedOn = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: ThemeTextRegular.notoR16,
      validator: validator,
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText ?? '약관 전체 동의',
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 31, left: 19),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                border: Border.all(
                    color: turnedOn! ? ThemeColors.blue : ThemeColors.gray1,
                    width: 1.5),
                shape: BoxShape.circle),
            child: CustomIcon(
              imagePath: turnedOn!
                  ? 'assets/icons/checked_ic.png'
                  : 'assets/icons/unchecked_ic.png',
              height: 24,
            ),
          ),
        ),
        hintStyle: ThemeTextRegular.notoR15
            .copyWith(color: turnedOn! ? ThemeColors.blue : ThemeColors.gray1),
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        filled: true,
        fillColor: ThemeColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          borderSide: BorderSide(
              width: 1,
              color: turnedOn! ? ThemeColors.blue : ThemeColors.gray2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          borderSide: BorderSide(
              width: 1,
              color: turnedOn! ? ThemeColors.blue : ThemeColors.gray2),
        ),
        constraints: BoxConstraints(
          maxWidth: 232,
        ),
      ),
    );
  }
}
