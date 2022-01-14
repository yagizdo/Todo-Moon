import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Pages/add_todo.dart';
import 'package:todo_app/Pages/calendar_page.dart';
import 'package:todo_app/Pages/dashboard_page.dart';
import 'package:todo_app/Pages/home_page.dart';
import 'package:todo_app/Pages/profile_page.dart';
import 'package:todo_app/Pages/welcome_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';

import 'Pages/main_screen.dart';

void main() {
  runApp(
      ChangeNotifierProvider<TodosProvider>(
          create: (BuildContext context) => TodosProvider(),
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'ToDo App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Consumer<TodosProvider>(
      builder: (context, state,child) => state.nameIsEmpty() == true ? const WelcomeScreen() :const MainScreen(),
      ),
    );
  }
}


