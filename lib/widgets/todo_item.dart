import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomovie/models/todo.dart';
import 'package:todomovie/models/todo_list.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      trailing: Checkbox(
        value: todo.isDone,
        onChanged: (bool? value) {
          Provider.of<TodoList>(context, listen: false).toggleDone(todo.id);
        },
      ),
      onLongPress: () {
        Provider.of<TodoList>(context, listen: false).removeTodo(todo.id);
      },
    );
  }
}
