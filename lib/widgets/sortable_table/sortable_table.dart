import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';
import 'package:widgetbook_2/base/theme_additional.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_2/base/theme_text_style.dart';
import 'package:widgetbook_2/widgets/inputs/input.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookStory(name: 'Sortable Table', type: SortableTable)
Widget defaultSortableTableStory(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width,
    height: height,
    color: ThemeColors.blue100,
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SortableTable(
          stateList: ['BIN/IIN', 'Store Name', 'Transaction Id'],
          headNames: ['BIN/IIN', 'Store Name', 'Transaction Id'],
          selectedItems: [false, true, false],
        ),
      ],
    ),
  );
}

class SortableTable extends StatefulWidget {
  ///TODO MAKE PARAMS REQUIRED
  // DownloadState? listType;
  List<String> stateList;
  List<bool>? selectedItems;
  List<String>? headNames;

  void onReorder;
  void Function(bool?)? onChanged;

  SortableTable({
    Key? key,
    this.onReorder,
    this.onChanged,
    // this.listType,
    required this.stateList,
    this.selectedItems,
    this.headNames,
  }) : super(key: key);

  @override
  _SortableTableState createState() => _SortableTableState();
}

class _SortableTableState extends State<SortableTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 300,
      // height: 420,
      height: widget.headNames!.length > 6
          ? 420
          : (54 * widget.headNames!.length).toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ThemeColors.white,
        boxShadow: ThemeShadows.shadowMd,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.only(top: 10.0, bottom: 0),
            //   child: ListTile(
            //     title: Text(
            //       'All',
            //       style: ThemeTextMedium.sm.apply(color: ThemeColors.coolgray600),
            //     ),
            //     leading: Checkbox(
            //       checkColor: Colors.white,
            //       value: eq(Constants.approvedHeadNamesConst, widget.headNames),
            //       onChanged: (bool? value) {
            //         setState(() {
            //           _checked = value!;
            //         });
            //         print('CHECKKKK');
            //         print(value);
            //         print('CHECKKKK');
            //         appStore.dispatch(UpdateUIAction(
            //             approvedHeadNames: Constants.approvedHeadNamesConst));
            //       },
            //     ),
            //   ),
            // ),
            ReorderableListView(
                buildDefaultDragHandles: true,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                children: _generateList(widget.selectedItems!),
                onReorder: reorderData),
          ],
        ),
      ),
    );
  }

  Function eq = const ListEquality().equals;

  List<Widget> _generateList(List<bool> selectedItems) {
    List<Widget> list = [];
    for (final item in widget.headNames!) {
      list.add(
        Container(
          key: Key(item),
          child: ListTile(
            title: Text(
              // item,
              item.toString(),
              style: ThemeTextMedium.sm.apply(color: ThemeColors.coolgray600),
            ),
            leading: Checkbox(
              checkColor: Colors.white,
              value: selectedItems[widget.headNames!.indexOf(item)],
              onChanged: (bool? value) {
                setState(() {
                  selectedItems[widget.headNames!.indexOf(item)] = value!;
                });
                if (value!) {
                  widget.stateList
                      .insert(widget.headNames!.indexOf(item), item);
                } else {
                  widget.stateList.removeAt(widget.headNames!.indexOf(item));
                }
                // _updateListType();
              },
            ),
          ),
        ),
      );
    }
    return list;
  }

  void reorderData(int oldindex, int newindex) {
    if (widget.selectedItems![oldindex]) {
      setState(() {
        if (newindex > oldindex) {
          newindex -= 1;
        }

        final item = widget.headNames![oldindex];
        widget.stateList.remove(item);
        final selected = widget.selectedItems!.removeAt(oldindex);
        final selectedNames = widget.headNames!.removeAt(oldindex);

        widget.stateList.insert(newindex, item);
        widget.selectedItems!.insert(newindex, selected);
        widget.headNames!.insert(newindex, selectedNames);
        // _updateListType();
      });
    }
  }

  // _updateListType() {
  //   switch (widget.listType) {
  //     case DownloadState.STORE:
  //       appStore.dispatch(UpdateUIAction(approvedHeadNames: widget.stateList));
  //       break;
  //     case DownloadState.APPROVED:
  //       appStore.dispatch(UpdateUIAction(approvedHeadNames: widget.stateList));
  //       break;

  //     case DownloadState.ACQUIRED:
  //       appStore.dispatch(UpdateUIAction(acquiredHeadNames: widget.stateList));
  //       break;

  //     case DownloadState.SETTLEMENT:
  //       appStore.dispatch(UpdateUIAction(approvedHeadNames: widget.stateList));
  //       break;
  //     case DownloadState.SETTLEMENTDETAIL:
  //       appStore.dispatch(UpdateUIAction(approvedHeadNames: widget.stateList));
  //       break;
  //     default:
  //       appStore.dispatch(UpdateUIAction(approvedHeadNames: widget.stateList));
  //   }
  // }
}
