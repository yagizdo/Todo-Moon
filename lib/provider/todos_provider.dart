import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/provider/shared_prefences_helper.dart';

class TodosProvider extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  String _name = '';
  String _surname = '';

  //initial state
  List<Todo> todos = [];

  List<Todo> todosList = [];

  List<Todo> completedTodosList = [];

  List<Todo> getTodos(DateTime day) {
    todosList = unCompletedTodos.where((Todo) {
      return DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).day ==
              day.day &&
          DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).month ==
              day.month &&
          DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).year ==
              day.year;
    }).toList();
    return todosList;
  }

  //  getter
  String get name => _name;
  String get surname => _surname;
  UnmodifiableListView<Todo> get allTodos =>
      UnmodifiableListView(todos.reversed);

  UnmodifiableListView<Todo> get completedTodos =>
      UnmodifiableListView(todos.reversed.where((todo) => todo.complete));

  UnmodifiableListView<Todo> get unCompletedTodos =>
      UnmodifiableListView(todos.reversed.where((todo) => !todo.complete));

//  methods for To-do
  void addTodo(Todo todo) {
    todos.add(todo);
    saveDataToLocalStorage();
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    updateDataToLocalStorage();
    checkCompletedTodos();
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    var index = todos.indexOf(todo);
    todos[index].toggleCompleted();
    updateDataToLocalStorage();
    notifyListeners();
  }

  void editTodo(Todo todo, String titleText, String description,
      String category, int dateMilliseconds) {
    todo.title = titleText;
    todo.description = description;
    todo.category = category;
    todo.dateMilliseconds = dateMilliseconds;
    updateDataToLocalStorage();
    notifyListeners();
  }

  // For delete completed todos
  bool checkCompletedTodos() {
    if (completedTodos.isEmpty) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  void removeCompletedTodos() {
    todos.forEach((todo) {
      if (todo.complete) {
        var index = todos.indexOf(todo);
        completedTodosList.add(todo);
        notifyListeners();
      }
    });
    todos.removeWhere((todo) => completedTodosList.contains(todo));
    updateDataToLocalStorage();
    notifyListeners();
  }

  // methods for shared preferences
  void initSharedPreferences() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    loadDataFromLocalStorage();
    getName();
    getSurname();
    notifyListeners();
  }

  void saveDataToLocalStorage() {
    List<String>? spList =
        todos.map((todo) => json.encode(todo.toJson())).toList();
    sharedPreferences!.setStringList('list', spList);
  }

  void loadDataFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    if (spList != null) {
      todos = spList.map((item) => Todo.fromMap(json.decode(item))).toList();
    }
  }

  void updateDataToLocalStorage() {
    List<String>? spList =
        todos.map((item) => json.encode(item.toJson())).toList();
    sharedPreferences?.remove('list');
    sharedPreferences!.setStringList('list', spList);
  }

  void saveName(String userText) {
    _name = userText;
    sharedPreferences!.setString('userName', userText);
    notifyListeners();
  }

  void savesurname(String userText) {
    _surname = userText;
    sharedPreferences!.setString('userSurname', userText);
    notifyListeners();
  }

  // To-do Percent Method
  double calcTodoPercent(DateTime day) {
    double percent = (completedTodos
            .where((Todo) =>
                DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                    .day ==
                DateTime.now().day)
            .length /
        allTodos
            .where((Todo) =>
                DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                    .day ==
                DateTime.now().day)
            .length);
    return (completedTodos == 0 && unCompletedTodos == 0) ? 0 : percent;
  }

  // Name and Surname Methods
  void setName(String userText) {
    if (userText.isEmpty) {
    } else {
      saveName(userText);
      notifyListeners();
    }
  }

  void setsurName(String userText) {
    if (userText.isEmpty) {
    } else {
      savesurname(userText);
      notifyListeners();
    }
  }

  String? getName() {
    String? spName = sharedPreferences?.getString('userName');
    if (spName != null) {
      _name = spName;
      notifyListeners();
      return spName;
    } else {
      return null;
    }
  }

  void getSurname() {
    String? spName = sharedPreferences!.getString('userSurname');
    if (spName != null) {
      _surname = spName;
      notifyListeners();
    } else {}
  }

  // Check Name
  Future<dynamic> readName(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }
}
