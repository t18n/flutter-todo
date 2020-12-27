import 'package:flutter/material.dart';

bool toggle = false;

class StrikeThrough extends StatelessWidget {
  final bool todoToggle;
  final String todoText;

  StrikeThrough({this.todoToggle, this.todoText}) : super();

  Widget _strikewidget() {
    if (todoToggle == false) {
      return Text(
        todoText,
        style: TextStyle(fontSize: 22.0),
      );
    } else {
      return Text(
        todoText,
        style: TextStyle(
            fontSize: 22.0,
            decoration: TextDecoration.lineThrough,
            color: Colors.redAccent,
            fontStyle: FontStyle.italic),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _strikewidget();
  }
}
