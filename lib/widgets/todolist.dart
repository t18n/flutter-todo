import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final List<String> items;
  final void Function(int, int) reorderData;

  TodoList({this.items, this.reorderData});

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      onReorder: reorderData,
      children: <Widget>[
        for (final item in items)
          Card(
            key: ValueKey(item),
            color: Colors.lime,
            elevation: 1,
            child: ListTile(
              // onTap: () => print('hey'),
              title: Text(item),
              leading: Icon(
                Icons.drag_handle,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
      ],
    );
  }
}
