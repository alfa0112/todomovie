import 'package:flutter/material.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Todo'),
      content: TextField(
        controller: _titleController,
        decoration: InputDecoration(
          labelText: 'Title',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(null);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_titleController.text.trim());
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
