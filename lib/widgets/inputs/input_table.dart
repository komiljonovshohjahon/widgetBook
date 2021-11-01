import 'package:flutter/material.dart';

class InputTable extends StatelessWidget {
  double? verticalSpacing;

  List<Widget> listOfInput;
  int? columnCount;

  InputTable({
    Key? key,
    required this.listOfInput,
    this.verticalSpacing = 32,
    this.columnCount = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: TableBuilder(
        verticalSpacing: verticalSpacing,
        columnCnt: columnCount!,
        children: listOfInput,
      ).build(),
    );
  }
}

class TableBuilder {
  int columnCnt;
  num? horizontalSpacing;
  num? verticalSpacing;
  List<Widget> children;

  TableBuilder({
    required this.columnCnt,
    required this.children,
    this.horizontalSpacing = 64,
    this.verticalSpacing = 32,
  });

  List<TableRow> build() {
    if (children == null) {
      return [
        const TableRow(children: [TableCell(child: Text(""))])
      ];
    }

    List<TableRow> rows = [];

    for (int i = 0; i < children.length;) {
      List<TableCell> cols = [];

      for (int j = 0; j < columnCnt; j++) {
        if (i < children.length) {
          if (columnCnt != 1) {
            cols.add(
              TableCell(
                child: Padding(
                  padding: j % 2 == 0
                      ? EdgeInsets.only(right: horizontalSpacing!.toDouble())
                      : EdgeInsets.zero,
                  child: children[i],
                ),
              ),
            );
          } else {
            cols.add(
              TableCell(
                child: children[i],
              ),
            );
          }
        } else {
          cols.add(const TableCell(child: Text("")));
        }
        i++;
      }
      rows.add(TableRow(
        children: cols,
      ));
      if (columnCnt == 1) {
        rows.add(TableRow(children: [
          SizedBox(height: verticalSpacing!.toDouble()),
        ]));
      }
    }

    return rows;
  }
}
