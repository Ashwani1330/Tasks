import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/todo_provider.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.teal, // Set your primary color here
          checkboxTheme: CheckboxThemeData(
            checkColor: WidgetStateProperty.all(Colors.teal),
            fillColor: WidgetStateProperty.all(Colors.white), // Set checkbox color
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.teal, // Set FAB color
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.teal, // Set AppBar color
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}