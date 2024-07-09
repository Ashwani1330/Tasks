import 'package:flutter/cupertino.dart';
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    var todo = _todos.firstWhere((todo) => todo.id == id);
    todo.isDone = !todo.isDone;
    notifyListeners();
  }
}