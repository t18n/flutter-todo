import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/todolist.dart';

class Home extends StatefulWidget {
  final List<Task> _items = [
    Task(id: '1', task: 'Task 1', isDone: false),
    Task(id: '2', task: 'Task 2', isDone: false),
    Task(id: '3', task: 'Task 3', isDone: true),
    Task(id: '4', task: 'Task 4', isDone: false)
  ];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = widget._items.removeAt(oldindex);
      widget._items.insert(newindex, items);
    });
  }

  void sorting() {
    setState(() {
      widget._items.sort((a, b) => a.id.compareTo(b.id));
    });
  }

  void onToggleDone(bool, String id) {
    setState(() {
      if (!bool) {
        widget._items.firstWhere((el) => el.id == id).isDone = false;
      } else {
        widget._items.firstWhere((el) => el.id == id).isDone = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "TODO List",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            tooltip: "Sort",
            onPressed: sorting,
          )
        ],
      ),
      body: TodoList(
        items: widget._items,
        reorderData: reorderData,
        onToggleDone: onToggleDone,
      ),
    );
  }
}
