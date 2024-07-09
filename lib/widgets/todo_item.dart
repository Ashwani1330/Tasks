import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/todo_provider.dart';

import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      trailing: Checkbox(
        value: todo.isDone,
        onChanged: (value) {
          Provider.of<TodoProvider>(context, listen: false).toggleTodoStatus(todo.id);
        },
      ),
    );
  }
}