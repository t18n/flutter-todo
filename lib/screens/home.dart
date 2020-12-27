import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/todolist.dart';

class Home extends StatefulWidget {
  final List<String> _items = List.generate(10, (i) => i.toString());

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
      widget._items.sort();
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
      ),
    );
  }
}
