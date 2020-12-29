import 'package:flutter/material.dart';

class CreateTaskForm extends StatelessWidget {
  final textController = TextEditingController();
  final void Function(String) onButtonPressed;

  CreateTaskForm({this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 4,
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: "New task",
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: Colors.blue[300],
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: Colors.blue[100],
                        width: 1,
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: FlatButton(
                  child: Text('Add'),
                  onPressed: () => onButtonPressed(textController.text),
                ))
          ],
        )
      ],
    ));
  }
}
