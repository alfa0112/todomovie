import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/models/todo_list.dart';
import 'todo_item.dart';

class DoneTodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoList>(
      builder: (context, todoList, child) {
        return ListView.builder(
          itemCount: todoList.doneTodos.length,
          itemBuilder: (context, index) {
            final todo = todoList.doneTodos[index];
            return TodoItem(todo: todo);
          },
        );
      },
    );
  }
}
