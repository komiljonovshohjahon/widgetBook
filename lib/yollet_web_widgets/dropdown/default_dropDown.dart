import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/yollet_web_widgets/buttons/button_variants.dart';

Widget dropdown() => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultDropdown(
          size: ButtonSize.S,
          value: 'First',
          onChanged: (value) {},
          listValues: ['First', 'Second', 'Third'],
        ),
        SizedBox(
          width: 20,
        ),
        DefaultDropdown(
          size: null,
          value: 'First value',
          onChanged: (value) {},
          listValues: ['First value', 'Second value', 'Third value'],
        ),
      ],
    );

class DefaultDropdown extends StatefulWidget {
  String? hintText;
  String? label;
  ButtonSize? size;
  List<String> listValues;
  dynamic value;
  String? note;
  String? errorText;
  bool? readOnly;

  ValueChanged onChanged;

  DefaultDropdown({
    this.label,
    this.hintText = "",
    required this.onChanged,
    required this.listValues,
    this.value,
    this.size,
    this.errorText,
    this.readOnly,
    this.note,
  });
  @override
  _DefaultDropdownState createState() => _DefaultDropdownState();
}

class _DefaultDropdownState extends State<DefaultDropdown> {
  double? itemWidth;
  double? boxHeight;

  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];

  @override
  void initState() {
    super.initState();
    _dropdownTestItems = _buildDropdownTestItems(widget.listValues);
    _getSize();
  }

  List<DropdownMenuItem<Object?>> _buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Row(
            children: [
              Text(i,
                  style:
                      ThemeTextMedium.sm.apply(color: ThemeColors.coolgray800)),
            ],
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width * 5 / 6 - 48 - 64 - 30) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.label!,
              style:
                  ThemeTextSemiBold.base.apply(color: ThemeColors.coolgray600),
            ),
          ),
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1, color: ThemeColors.gray200)),
          child: DropdownBelow(
            elevation: 0,
            boxTextstyle:
                ThemeTextRegular.base.apply(color: ThemeColors.coolgray100),
            boxPadding: const EdgeInsets.symmetric(horizontal: 10),
            boxWidth: itemWidth ?? width,
            itemWidth: itemWidth ?? width,
            boxHeight: boxHeight,
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            icon: const HeroIcon(
              HeroIcons.chevronDown,
              size: 20,
              color: ThemeColors.coolgray600,
            ),
            hint: widget.hintText != null
                ? Text(
                    widget.hintText!,
                    style: ThemeTextRegular.base
                        .apply(color: ThemeColors.coolgray400),
                  )
                : Container(),
            value: widget.value,
            items: _dropdownTestItems,
            onChanged: widget.onChanged,
          ),
        ),
        if (widget.note != null)
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              widget.note!,
              style: ThemeTextRegular.sm.apply(color: ThemeColors.coolgray400),
            ),
          ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              widget.errorText!,
              style: ThemeTextRegular.base.apply(color: ThemeColors.red500),
            ),
          ),
      ],
    );
  }

  _getSize() {
    switch (widget.size) {
      case ButtonSize.S:
        itemWidth = 116;
        boxHeight = 40;
        break;
      default:
        itemWidth = null;
        boxHeight = 40;
        break;
    }
  }
}
