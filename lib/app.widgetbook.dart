// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:widgetbook_2/app.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_2/widgets/buttons/default_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_2/widgets/appbar/logo_banner.dart';
import 'package:widgetbook_2/widgets/appbar/topbar.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:heroicons/heroicons.dart';
import 'package:widgetbook_2/widgets/appbar/navigation_bar.dart';
import 'package:widgetbook_2/widgets/banner/info_banner.dart';
import 'package:widgetbook_2/widgets/image_placeholder/image_placeholder.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/widgets/breadcrumbs/breadcrumbs.dart';
import 'package:widgetbook_2/base/theme_size_style.dart';
import 'package:widgetbook_2/widgets/buttons/button_variants.dart';
import 'package:hovering/hovering.dart';
import 'package:widgetbook_2/base/theme_additional.dart';
import 'package:widgetbook_2/widgets/cards/card.dart';
import 'package:widgetbook_2/widgets/cards/cards_container.dart';
import 'package:widgetbook_2/widgets/datepicker/default_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:widgetbook_2/widgets/dropdown/default_dropDown.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:widgetbook_2/widgets/modals/default_modal.dart';
import 'package:widgetbook_2/widgets/sidebar/sidebar.dart';
import 'package:widgetbook_2/widgets/sidebar/sidebar_tab_parent.dart';
import 'package:widgetbook_2/widgets/sortable_table/sortable_table.dart';
import 'package:collection/collection.dart';
import 'package:widgetbook_2/widgets/inputs/input.dart';
import 'package:widgetbook_2/widgets/status/status_badge.dart';
import 'package:widgetbook_2/widgets/tabs/tab.dart';
import 'package:widgetbook_2/widgets/inputs/custom_input.dart';
import 'package:widgetbook_2/widgets/inputs/input_wrapper.dart';
import 'package:widgetbook_2/widgets/inputs/search_field.dart';
import 'package:widgetbook_2/widgets/inputs/input_table.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appInfo: AppInfo(name: 'Example App'),
      lightTheme: null,
      darkTheme: darkTheme(),
      categories: [
        Category(
          name: 'stories',
          folders: [
            Folder(
              name: 'widgets',
              folders: [
                Folder(
                  name: 'breadcrumbs',
                  widgets: [
                    WidgetElement(
                      name: 'Breadcrumb',
                      stories: [
                        Story(
                          name: 'Breadcrumb',
                          builder: (context) => defaultBreadcrumbStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'status',
                  widgets: [
                    WidgetElement(
                      name: 'StatusBadge',
                      stories: [
                        Story(
                          name: 'Status Badge',
                          builder: (context) =>
                              defaultStatusBadgeStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'sortable_table',
                  widgets: [
                    WidgetElement(
                      name: 'SortableTable',
                      stories: [
                        Story(
                          name: 'Sortable Table',
                          builder: (context) =>
                              defaultSortableTableStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'dropdown',
                  widgets: [
                    WidgetElement(
                      name: 'DefaultDropdown',
                      stories: [
                        Story(
                          name: 'Default Dropdown',
                          builder: (context) =>
                              defaultDefaultDropdownStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'appbar',
                  widgets: [
                    WidgetElement(
                      name: 'LogoBanner',
                      stories: [
                        Story(
                          name: 'App Bar',
                          builder: (context) => defaultLogoBannerStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'datepicker',
                  widgets: [
                    WidgetElement(
                      name: 'DefaultDatePicker',
                      stories: [
                        Story(
                          name: 'Default Date Picker',
                          builder: (context) =>
                              defaultDefaultDatePickerStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'banner',
                  widgets: [
                    WidgetElement(
                      name: 'InfoBanner',
                      stories: [
                        Story(
                          name: 'Info Banner',
                          builder: (context) => defaultInfoBannerStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'tabs',
                  widgets: [
                    WidgetElement(
                      name: 'DefaultTab',
                      stories: [
                        Story(
                          name: 'Default Tab',
                          builder: (context) => defaultDefaultTabStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'inputs',
                  widgets: [
                    WidgetElement(
                      name: 'InputForm',
                      stories: [
                        Story(
                          name: 'Inputs Widgets',
                          builder: (context) => defaultInputFormStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'image_placeholder',
                  widgets: [
                    WidgetElement(
                      name: 'ImagePlaceholder',
                      stories: [
                        Story(
                          name: 'Image Placeholder',
                          builder: (context) =>
                              defaultImagePlaceholderStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'sidebar',
                  widgets: [
                    WidgetElement(
                      name: 'SideBarVertical',
                      stories: [
                        Story(
                          name: 'SideBar Vertical',
                          builder: (context) =>
                              defaultSideBarVerticalStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'modals',
                  widgets: [
                    WidgetElement(
                      name: 'DefaultModal',
                      stories: [
                        Story(
                          name: 'Default Modal',
                          builder: (context) =>
                              defaultDefaultModalStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'cards',
                  widgets: [
                    WidgetElement(
                      name: 'CardsContainer',
                      stories: [
                        Story(
                          name: 'Cards Container',
                          builder: (context) =>
                              defaultCardsContainerStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
                Folder(
                  name: 'buttons',
                  widgets: [
                    WidgetElement(
                      name: 'DefaultButton',
                      stories: [
                        Story(
                          name: 'Default Button',
                          builder: (context) =>
                              defaultDefaultButtonStory(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
      devices: [
        Device(
            name: 'Yollet Web',
            resolution: Resolution(
              nativeSize: DeviceSize(
                width: 1440.0,
                height: 1000.0,
              ),
              scaleFactor: 1.0,
            ),
            type: DeviceType.desktop),
      ],
    );
  }
}
