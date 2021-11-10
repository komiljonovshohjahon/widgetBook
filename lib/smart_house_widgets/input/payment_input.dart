import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as INTL;
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';

class PaymentInput extends StatelessWidget {
  String? hintText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  String? errorText;
  PaymentInput(
      {this.hintText, this.validator, this.controller, this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: ThemeTextRegular.notoR16.copyWith(color: ThemeColors.blue),
      keyboardType: TextInputType.number,
      textDirection: TextDirection.rtl,
      // inputFormatters: [
      //   CurrencyKoInputFormatter(maxDigits: 20),
      // ],
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 10),
          child: const Text(
            '원',
            style: ThemeTextRegular.notoR16,
          ),
        ),
        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: ThemeColors.white,
        hintText: hintText ?? 'Payment input',
        errorText: errorText,
        errorStyle: ThemeTextRegular.notoR13.copyWith(color: ThemeColors.red),
        hintStyle: ThemeTextRegular.notoR16.copyWith(color: ThemeColors.gray1),
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
      ),
    );
  }
}

class CurrencyKoInputFormatter extends TextInputFormatter {
  CurrencyKoInputFormatter({required this.maxDigits});
  final int maxDigits;

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (maxDigits != null && newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }

    double value = double.parse(newValue.text);
    final formatter = new INTL.NumberFormat("000,000,000", "ko_KO");
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
