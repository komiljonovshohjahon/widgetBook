import 'package:flutter/material.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';

class InputWrapper extends StatelessWidget {
  Widget? input;
  String? label;
  String? labelRight;
  InputWrapper(
      {Key? key, required this.input, this.label = '', this.labelRight = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label!,
                style: ThemeTextSemiBold.base
                    .apply(color: ThemeColors.coolgray600)),
            Text(labelRight!,
                style: ThemeTextRegular.base.apply(color: ThemeColors.red500)),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        input!,
      ],
    );
  }
}
