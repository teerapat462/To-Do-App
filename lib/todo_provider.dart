import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  final String imageName;
  bool isCompleted;

  Todo({
    required this.title,
    required this.description,
    required this.imageName,
    this.isCompleted = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      description: json['description'],
      imageName: json['imageName'],
    );
  }
}

class TodoProvider with ChangeNotifier {
  final List<Todo> _userSelectedTodos = [];
  List<Todo> _availableTodos = [];

  List<Todo> get userSelectedTodos => _userSelectedTodos;
  List<Todo> get availableTodos => _availableTodos;

  Future<void> loadTodosFromJson() async {
    final String response = await rootBundle.loadString('assets/todos.json');
    final List<dynamic> data = json.decode(response);
    _availableTodos = data.map((todo) => Todo.fromJson(todo)).toList();
    notifyListeners();
  }

  void addTodo(Todo todo) {
    _userSelectedTodos.add(todo);
    _availableTodos.remove(todo);
    notifyListeners();
  }

  void completeTodoAndRemove(Todo todo) {
    _userSelectedTodos.remove(todo);
    notifyListeners();
    _availableTodos.add(todo);
  }
}
