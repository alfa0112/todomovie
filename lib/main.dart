import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/models/todo.dart';
import 'package:hello_world/models/todo_list.dart';
import 'package:hello_world/widgets/new_todo_dialog.dart';
import 'package:hello_world/widgets/todo_list_view.dart';
import 'package:hello_world/widgets/done_todo_list_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoList(),
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Todos'),
            Tab(text: 'Done'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TodoListView(),
          DoneTodoListView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final title = await showDialog<String>(
            context: context,
            builder: (context) => NewTodoDialog(),
          );
          if (title != null && title.isNotEmpty) {
            Provider.of<TodoList>(context, listen: false).addTodo(
              Todo(
                id: DateTime.now().toString(),
                title: title,
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}