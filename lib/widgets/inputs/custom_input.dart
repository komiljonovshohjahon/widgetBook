import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/widgets/inputs/input.dart';
import 'package:widgetbook_2/widgets/inputs/input_table.dart';
import 'package:widgetbook_2/widgets/inputs/input_wrapper.dart';
import 'package:widgetbook_2/widgets/inputs/search_field.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookStory(name: 'Inputs Widgets', type: InputForm)
Widget defaultInputFormStory(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width,
    height: height,
    color: ThemeColors.blue100,
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        InputForm(
          hint: 'Example of Input Form',
          suffix: const HeroIcon(HeroIcons.academicCap),
        ),
        SizedBox(
          height: 20,
        ),
        SearchField(),
        SizedBox(
          height: 20,
        ),
        InputWrapper(
          input: InputForm(
            hint: 'Example of Input Wrapper',
            suffix: const HeroIcon(HeroIcons.academicCap),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: ThemeColors.gray100,
          padding: EdgeInsets.all(16),
          child: InputTable(
            listOfInput: [
              InputWrapper(
                input: InputForm(
                  hint: 'Example',
                  suffix: const HeroIcon(HeroIcons.academicCap),
                ),
              ),
              InputWrapper(
                input: InputForm(
                  hint: 'Example',
                  suffix: const HeroIcon(HeroIcons.academicCap),
                ),
              ),
              InputWrapper(
                input: InputForm(
                  hint: 'Example',
                  suffix: const HeroIcon(HeroIcons.academicCap),
                ),
              ),
              InputWrapper(
                input: InputForm(
                  hint: 'Example',
                  suffix: const HeroIcon(HeroIcons.academicCap),
                ),
              ),
            ],
          ),
        ),
        CustomTextFieldWidget(
          labelText: 'Example',
        )
      ],
    ),
  );
}

class CustomTextFieldWidget extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initText;
  final bool? isPassword;
  final bool? isTransparent;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  // String value;

  CustomTextFieldWidget(
      {Key? key,
      this.labelText,
      this.hintText,
      this.initText = "",
      this.isPassword = false,
      this.isTransparent = false,
      this.onChanged,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.controller})
      : super(key: key);
  @override
  CustomTextFieldWidgetState createState() => CustomTextFieldWidgetState();
}

class CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.text = widget.initText!;
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void clear(controller) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        controller.clear();
        inputController.text = widget.initText!;
        widget.onChanged!(inputController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller ?? inputController,
      obscureText: widget.isPassword!,
      style: ThemeTextRegular.base.apply(color: ThemeColors.coolgray800),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          hintText: widget.hintText,
          hintStyle:
              ThemeTextRegular.base.apply(color: ThemeColors.coolgray800),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(
                  color: widget.isTransparent!
                      ? ThemeColors.transparent
                      : ThemeColors.gray200)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(const Radius.circular(6.0)),
            borderSide: BorderSide(
                color: widget.isTransparent!
                    ? ThemeColors.transparent
                    : ThemeColors.gray200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(const Radius.circular(6.0)),
            borderSide: BorderSide(
                color: widget.isTransparent!
                    ? ThemeColors.transparent
                    : ThemeColors.orange400),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
                color: widget.isTransparent!
                    ? ThemeColors.transparent
                    : ThemeColors.red400),
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.cancel,
              color: ThemeColors.gray300,
            ),
            onPressed: () => clear(inputController),
          )),
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      // onSaved: (String val) {
      //   widget.value = val;
      // }
    );
  }
}
