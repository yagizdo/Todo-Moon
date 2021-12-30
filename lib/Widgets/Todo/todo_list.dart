import 'package:flutter/material.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Pages/detail_screen.dart';
import 'package:todo_app/Widgets/Todo/todo_card.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    var todos = <Todo>[Todo('Work', 'Create wireframes', false),Todo('Family & Friends', 'Dinner with parents', false),Todo('Todo 3', 'todo3', false),Todo('Todo 4', 'todo4', false)];
    return Padding(
      padding: const EdgeInsets.only(top : 20.0),
      child: Column(
        children: [
          SizedBox(
            width: 400,
            height: 200,
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(
                  todo: todos[index],
                );
              }),
        ),
  ],
      ),
    );
  }
}

