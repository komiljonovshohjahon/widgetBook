import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';
import 'package:widgetbook_2/yollet_web_widgets/yollet_web_widget_exporter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Sortable Table', type: SortableTable)
Widget defaultSortableTableStory() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SortableTable(
        stateList: ['BIN/IIN', 'Store Name', 'Transaction Id'],
        headNames: ['BIN/IIN', 'Store Name', 'Transaction Id'],
        selectedItems: [false, false, false],
      ),
    ],
  );
}

class SortableTable extends StatefulWidget {
  List<String> stateList;
  List<bool>? selectedItems;
  List<String>? headNames;

  void onReorder;
  void Function(bool?)? onChanged;

  SortableTable({
    Key? key,
    this.onReorder,
    this.onChanged,
    required this.stateList,
    this.selectedItems,
    this.headNames,
  }) : super(key: key);

  @override
  _SortableTableState createState() => _SortableTableState();
}

class _SortableTableState extends State<SortableTable> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ThemeColors.gray500,
        boxShadow: ThemeShadows.shadowMd,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 0),
                child: ListTile(
                    title: Text(
                      'All',
                      style: ThemeTextMedium.sm
                          .apply(color: ThemeColors.coolgray600),
                    ),
                    leading: Checkbox(
                        fillColor: MaterialStateProperty.all<Color?>(
                            Colors.blueAccent),
                        checkColor: Colors.white,
                        value: _checked,
                        onChanged: (bool? value) {
                          for (var element in widget.headNames!) {
                            setState(() {
                              _checked = value!;
                              widget.selectedItems![
                                  widget.headNames!.indexOf(element)] = value;
                            });
                          }
                        }))),
            ReorderableListView(
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
              item.toString(),
              style: ThemeTextRegular.sm.apply(color: ThemeColors.white),
            ),
            leading: Checkbox(
              fillColor: MaterialStateProperty.all<Color?>(Colors.blueAccent),
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
      });
    }
  }
}
