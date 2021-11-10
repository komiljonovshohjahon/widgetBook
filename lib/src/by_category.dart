import 'dart:core';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';
import 'package:widgetbook_2/src/by_usecase.dart';
import 'package:widgetbook_2/src/by_widget.dart';
import 'package:widgetbook_2/yollet_web_widgets/inputs/custom_input.dart'
    as inputContainer;
import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';

WidgetbookCategory yolletWebCategory() {
  return WidgetbookCategory(name: 'Yollet Web Admin Dashboard', widgets: [
    yolletWebWidget(name: 'Breadcrumb', useCases: [
      yolletWebUsecase(name: 'Breadcrumb', widget: defaultBreadcrumbStory())
    ]),
    yolletWebWidget(name: 'Default Button', useCases: [
      yolletWebUsecase(
          name: 'Default Button', widget: defaultDefaultButtonStory())
    ]),
    yolletWebWidget(name: 'Banner', useCases: [
      yolletWebUsecase(name: 'Banner', widget: defaultLogoBannerStory()),
      yolletWebUsecase(name: 'Tab', widget: defaultDefaultTabStory()),
      yolletWebUsecase(
          name: 'Image placeholder', widget: defaultImagePlaceholderStory()),
    ]),
    yolletWebWidget(name: 'Card', useCases: [
      yolletWebUsecase(name: 'Card', widget: defaultCardStory()),
      yolletWebUsecase(
          name: 'Cards Container', widget: defaultCardsContainerStory())
    ]),
    yolletWebWidget(name: 'Input field', useCases: [
      yolletWebUsecase(name: 'Input field', widget: defaultInputFormStory()),
      yolletWebUsecase(
          name: 'Input field container',
          widget: inputContainer.defaultInputFormContainerStory())
    ]),
    yolletWebWidget(name: 'Dropdown', useCases: [
      yolletWebUsecase(name: 'Dropdown', widget: dropdown()),
    ]),
    yolletWebWidget(name: 'Modal', useCases: [
      yolletWebUsecase(name: 'Modal', widget: defaultDefaultModalStory())
    ]),
    yolletWebWidget(name: 'Sidebar', useCases: [
      yolletWebUsecase(name: 'Sidebar', widget: defaultSideBarVerticalStory())
    ]),
    yolletWebWidget(name: 'Sortable list', useCases: [
      yolletWebUsecase(
          name: 'Sortable list', widget: defaultSortableTableStory())
    ]),
    yolletWebWidget(name: 'Status badge', useCases: [
      yolletWebUsecase(name: 'Status badge', widget: defaultStatusBadgeStory())
    ]),
  ]);
}

WidgetbookCategory smartHouseCategory() {
  return WidgetbookCategory(name: 'Smart House Category', widgets: [
    yolletWebWidget(name: 'Button', useCases: [
      yolletWebUsecase(name: 'Button', widget: smartHouseButtonStory())
    ]),
  ]);
}
