import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/Models/todo.dart';

class TodosProvider extends ChangeNotifier {
  //initial state
  final List<Todo> todos = [
    Todo(title: 'Go to work!', description: 'Slm cnm', category: 'Work'),
    Todo(title: 'Go to work 2!', description: 'Slm cnm 2', category: 'Home'),
    Todo(title: 'Go to work 3!', description: 'Slm cnm 3', category: 'Travel'),
    Todo(title: 'Go to work 3!', description: 'Slm cnm 3', category: 'Travel'),
    Todo(title: 'Go to work 3!', description: 'Slm cnm 3', category: 'Travel'),
    Todo(title: 'Go to work 3!', description: 'Slm cnm 3', category: 'Travel'),
    Todo(title: 'Go to work 3!', description: 'Slm cnm 3', category: 'Travel'),
    Todo(title: 'Go to work 3!', description: 'Slm cnm 3', category: 'Travel'),
  ];

  //  getter
  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos.reversed);

  UnmodifiableListView<Todo> get completedTodos =>
      UnmodifiableListView(todos.reversed.where((todo) => todo.complete));

  UnmodifiableListView<Todo> get unCompletedTodos =>
      UnmodifiableListView(todos.reversed.where((todo) => !todo.complete));

//  methods
  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }  
  
  void removeTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    var index = todos.indexOf(todo);
    todos[index].toggleCompleted();
    notifyListeners();
  }

}
