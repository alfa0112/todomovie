import 'package:flutter/foundation.dart';
import 'todo.dart';

class TodoList with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => !todo.isDone).toList();
  List<Todo> get doneTodos => _todos.where((todo) => todo.isDone).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleDone(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.isDone = !todo.isDone;
    notifyListeners();
  }
}
