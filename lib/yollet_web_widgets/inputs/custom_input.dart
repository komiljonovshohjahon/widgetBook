import 'package:widgetbook_2/yollet_web_widgets/inputs/input_wrapper.dart';
import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Inputs Widgets', type: InputForm)
Widget defaultInputFormStory() {
  return Column(
    children: [
      InputForm(
        hint: 'Example of Input Form',
        suffix: const HeroIcon(HeroIcons.academicCap),
      ),
      SearchField(),
      const SizedBox(
        height: 40,
      ),
      CustomTextFieldWidget(
        labelText: 'Example',
      )
    ],
  );
}

Widget defaultInputFormContainerStory() {
  return Container(
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
