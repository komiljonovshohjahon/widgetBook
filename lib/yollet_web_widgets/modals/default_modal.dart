import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default Modal', type: DefaultModal)
Widget defaultDefaultModalStory() {
  return Column(
    children: [DefaultModal(title: 'Remove store')],
  );
}

class DefaultModal extends StatelessWidget {
  VoidCallback? onConfirm;
  VoidCallback? onCancel;
  String? title;
  String? subTitle;
  List<Widget>? buttons;
  HeroIcons? icon;

  DefaultModal(
      {Key? key,
      this.onConfirm,
      this.onCancel,
      this.buttons,
      this.title,
      this.subTitle,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.0,
      height: 191.0,
      decoration: BoxDecoration(
        boxShadow: ThemeShadows.shadowLg,
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(6.0)),
              color: ThemeColors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 19.0,
                  backgroundColor: ThemeColors.orange100,
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 20.0, maxHeight: 20.0),
                    child: HeroIcon(
                      icon ?? HeroIcons.exclamation,
                      color: ThemeColors.orange500,
                    ),
                  ),
                ),
                const SizedBox(width: 11.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title ?? 'remove_store',
                        style: ThemeTextRegular.lg
                            .apply(color: ThemeColors.coolgray900)),
                    const SizedBox(height: 8.0),
                    Text(
                        subTitle ??
                            'Are you sure to remove this store? This\naction cannot be undone',
                        style: ThemeTextRegular.sm
                            .apply(color: ThemeColors.coolgray500)),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: ThemeColors.coolgray50,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buttons ??
                  [
                    DefaultButton(
                      text: 'cancel',
                      onPressed: onCancel,
                      sizeOfButton: ButtonSize.S,
                      variant: ButtonVariant.GHOST,
                    ),
                    const SizedBox(width: 16.0),
                    DefaultButton(
                      text: 'remove',
                      onPressed: onConfirm,
                      sizeOfButton: ButtonSize.S,
                      variant: ButtonVariant.PRIMARY,
                    ),
                  ],
            ),
          ),
        ],
      ),
    );
  }
}
