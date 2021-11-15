import 'dart:core';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_2/smart_house_widgets/smarthouse_template/base/template.dart';
import 'package:widgetbook_2/smart_house_widgets/tab/tab_container.dart';
import 'package:widgetbook_2/src/by_usecase.dart';
import 'package:widgetbook_2/src/by_widget.dart';
import 'package:widgetbook_2/yollet_web_widgets/inputs/custom_input.dart'
    as inputContainer;
import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';

WidgetbookCategory yolletWebCategory() {
  return WidgetbookCategory(name: 'Yollet Web Admin Dashboard', widgets: [
    yolletWebWidget(name: 'Breadcrumb YWAD', useCases: [
      yolletWebUsecase(
          name: 'Breadcrumb YWAD', widget: defaultBreadcrumbStory())
    ]),
    yolletWebWidget(name: 'Default Button YWAD', useCases: [
      yolletWebUsecase(
          name: 'Default Button YWAD', widget: defaultDefaultButtonStory())
    ]),
    yolletWebWidget(name: 'Banner YWAD', useCases: [
      yolletWebUsecase(name: 'Banner YWAD', widget: defaultLogoBannerStory()),
      yolletWebUsecase(name: 'Tab YWAD', widget: defaultDefaultTabStory()),
      yolletWebUsecase(
          name: 'Image placeholder YWAD',
          widget: defaultImagePlaceholderStory()),
    ]),
    yolletWebWidget(name: 'Card YWAD', useCases: [
      yolletWebUsecase(name: 'Card  YWAD', widget: defaultCardStory()),
      yolletWebUsecase(
          name: 'Cards Container  YWAD', widget: defaultCardsContainerStory())
    ]),
    yolletWebWidget(name: 'Input field  YWAD', useCases: [
      yolletWebUsecase(
          name: 'Input field YWAD', widget: defaultInputFormStory()),
      yolletWebUsecase(
          name: 'Input field container  YWAD',
          widget: inputContainer.defaultInputFormContainerStory())
    ]),
    yolletWebWidget(name: 'Dropdown YWAD', useCases: [
      yolletWebUsecase(name: 'Dropdown  YWAD', widget: dropdown()),
    ]),
    yolletWebWidget(name: 'Modal  YWAD', useCases: [
      yolletWebUsecase(name: 'Modal YWAD', widget: defaultDefaultModalStory())
    ]),
    yolletWebWidget(name: 'Sidebar  YWAD', useCases: [
      yolletWebUsecase(
          name: 'Sidebar YWAD', widget: defaultSideBarVerticalStory())
    ]),
    yolletWebWidget(name: 'Sortable list YWAD', useCases: [
      yolletWebUsecase(
          name: 'Sortable list YWAD', widget: defaultSortableTableStory())
    ]),
    yolletWebWidget(name: 'Status badge YWAD', useCases: [
      yolletWebUsecase(
          name: 'Status badge YWAD', widget: defaultStatusBadgeStory())
    ]),
  ]);
}

WidgetbookCategory smartHouseCategory() {
  return WidgetbookCategory(name: 'Smart House Category', widgets: [
    yolletWebWidget(name: 'Button SM', useCases: [
      yolletWebUsecase(name: 'Button SM', widget: smartHouseButtonStory())
    ]),
    yolletWebWidget(name: 'Alert SM', useCases: [
      yolletWebUsecaseFunc(name: 'Alert SM', func: smartHouseAlertStory)
    ]),
    yolletWebWidget(name: 'Footer SM', useCases: [
      yolletWebUsecase(name: 'Footer', widget: smartHouseBNBStory())
    ]),
    yolletWebWidget(name: 'Input SM', useCases: [
      yolletWebUsecase(name: 'Input SM', widget: smartHouseInputStory())
    ]),
    yolletWebWidget(name: 'Stacked Container SM', useCases: [
      yolletWebUsecase(
          name: 'Stacked Container SM',
          widget: smartHouseStackedContainerStory())
    ]),
    yolletWebWidget(name: 'Header SM', useCases: [
      yolletWebUsecase(name: 'Header SM', widget: smartHouseHeaderStory())
    ]),
    // yolletWebWidget(name: 'Tabs SM', useCases: [
    //   yolletWebUsecase(
    //       name: 'Tabs Container SM', widget: smartHouseTabsContainerStory()),
    //   yolletWebUsecase(name: 'Tabs SM', widget: smartHouseTabsContainerStory()),
    // ]),
  ]);
}
