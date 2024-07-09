import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/models/todo.dart';
import 'package:tasks/providers/todo_provider.dart';
import 'package:uuid/uuid.dart';

class AddTodoScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final uuid = const Uuid();

  AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final todo = Todo(
                    id: uuid.v4(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                    isDone: false
                );
                Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
                Navigator.of(context).pop();
              },
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}