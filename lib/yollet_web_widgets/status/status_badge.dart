import 'package:flutter/material.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class StatusBadge extends StatelessWidget {
  String text;
  double? height;
  bool? isSuccess;
  bool? isError;
  bool? isWarning;
  bool? isProcessing;
  bool? isInactive;
  bool? isSquare;

  ///INIT success

  StatusBadge({
    Key? key,
    required this.text,
    this.height = 16,
    this.isInactive = false,
    this.isError = false,
    this.isProcessing = false,
    this.isSuccess = false,
    this.isWarning = false,
    this.isSquare = false,
  }) : super(key: key);

  Color bgColor = ThemeColors.emerald100;
  Color textColor = ThemeColors.emerald800;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    _buildStatus();

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isSquare! ? 4 : _width / 2),
            color: bgColor,
          ),
          height: height,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            text.toString(),
            style: ThemeTextRegular.xxs.apply(color: textColor),
          ),
        ),
      ],
    );
  }

  _buildStatus() {
    if (isInactive!) {
      bgColor = ThemeColors.coolgray200;
      textColor = ThemeColors.coolgray800;
    } else if (isError!) {
      bgColor = ThemeColors.red200;
      textColor = ThemeColors.red800;
    } else if (isWarning!) {
      bgColor = ThemeColors.amber200;
      textColor = ThemeColors.amber800;
    } else if (isProcessing!) {
      bgColor = ThemeColors.blue200;
      textColor = ThemeColors.blue800;
    }
  }
}

@WidgetbookUseCase(name: 'Status Badge', type: StatusBadge)
Widget defaultStatusBadgeStory() {
  return Column(
    children: [
      StatusBadge(
        text: 'Error',
        isError: true,
      ),
      const SizedBox(
        height: 16,
      ),
      StatusBadge(
        text: 'Success',
        isSuccess: true,
      ),
      const SizedBox(
        height: 16,
      ),
      StatusBadge(
        text: 'Inactive',
        isInactive: true,
      ),
      const SizedBox(
        height: 16,
      ),
      StatusBadge(
        text: 'Processing',
        isProcessing: true,
      ),
      const SizedBox(
        height: 16,
      ),
      StatusBadge(
        text: 'Square',
        isSquare: true,
      ),
      const SizedBox(
        height: 16,
      ),
      StatusBadge(
        text: 'Warning',
        isWarning: true,
      )
    ],
  );
}
