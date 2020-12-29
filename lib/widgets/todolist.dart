import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/createTaskForm.dart';
import 'package:flutter_todo/widgets/strikethrough.dart';

class Task {
  String id;
  String task;
  bool isDone;

  Task({this.id, this.task, this.isDone});
}

class TodoList extends StatelessWidget {
  final List<Task> items;
  final void Function(int, int) reorderData;
  final void Function(bool, String) onToggleDone;

  TodoList({this.items, this.reorderData, this.onToggleDone});

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: EdgeInsets.zero,
      onReorder: reorderData,
      children: <Widget>[
        for (var item in items)
          CheckboxListTile(
            value: item.isDone,
            onChanged: (bool) => onToggleDone(bool, item.id),
            key: Key(item.id),
            title: StrikeThrough(todoText: item.task, todoToggle: item.isDone),
          )
      ],
    );
  }
}
