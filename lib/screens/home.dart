
import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/createTaskForm.dart';
import 'package:flutter_todo/widgets/todolist.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:faker/faker.dart';

final uuid = Uuid();

class Home extends StatefulWidget {
  final List<Task> _items = [
    Task(id: uuid.v4(), task: faker.lorem.sentence(), isDone: false),
    Task(id: uuid.v4(), task: faker.lorem.sentence(), isDone: false),
    Task(id: uuid.v4(), task: faker.lorem.sentence(), isDone: true),
    Task(id: uuid.v4(), task: faker.lorem.sentence(), isDone: false)
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

  void onAddNewTask(String text) {
    if (text.isNotEmpty) {
      setState(() {
        widget._items.add(Task(id: uuid.v4(), task: text, isDone: false));
      });
    } else {
      Fluttertoast.showToast(
          msg: 'Task cannot be empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueAccent);
    }
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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: CreateTaskForm(
                      onButtonPressed: onAddNewTask,
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: TodoList(
                  items: widget._items,
                  reorderData: reorderData,
                  onToggleDone: onToggleDone,
                ),
              ))
            ]));
  }
}
