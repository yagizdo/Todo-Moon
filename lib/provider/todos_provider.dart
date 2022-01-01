import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Models/todo.dart';

class TodosProvider extends ChangeNotifier {
  SharedPreferences? sharedPreferences;

  //initial state
  List<Todo> todos = [];

  //  getter
  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos.reversed);

  UnmodifiableListView<Todo> get completedTodos =>
      UnmodifiableListView(todos.reversed.where((todo) => todo.complete));

  UnmodifiableListView<Todo> get unCompletedTodos =>
      UnmodifiableListView(todos.reversed.where((todo) => !todo.complete));

//  methods for Todo
  void addTodo(Todo todo) {
    todos.add(todo);
    saveDataToLocalStorage();
    notifyListeners();
  }
  
  void removeTodo(Todo todo) {
    todos.remove(todo);
    updateDataToLocalStorage();
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    var index = todos.indexOf(todo);
    todos[index].toggleCompleted();
    updateDataToLocalStorage();
    notifyListeners();
  }

  // methods for shared preferences
  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadDataFromLocalStorage();
    notifyListeners();
  }

  void saveDataToLocalStorage() {
    List<String>? spList =
    todos.map((todo) => json.encode(todo.toJson())).toList();
    sharedPreferences!.setStringList('list', spList);
  }

  void loadDataFromLocalStorage(){
    List<String>? spList = sharedPreferences!.getStringList('list');
    todos = spList!.map((item) => Todo.fromMap(json.decode(item))).toList();
  }

  void updateDataToLocalStorage() {
    List<String>? spList =
    todos.map((item) => json.encode(item.toJson())).toList();
    sharedPreferences?.remove('list');
    sharedPreferences!.setStringList('list', spList);
  }

}
