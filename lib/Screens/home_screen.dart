import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/Screens/add_todo_screen.dart';
import 'package:tasks/providers/todo_provider.dart';
import 'package:tasks/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          return ListView.builder(
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index) {
              return TodoItem(todo: todoProvider.todos[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTodoScreen(),
              )
          );
        },
        child : const Icon(Icons.add),
      ),
    );
  }
}