import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Pages/detail_screen.dart';
import 'package:todo_app/Widgets/Todo/todo_card.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Consumer<TodosProvider>(
        builder: (context, state, child) => SizedBox(
          height: MediaQuery.of(context).size.height / 3.7,
          child: ListView.builder(
              itemCount: state.unCompletedTodos.length,
              itemBuilder: (context, index) {
                return TodoCard(
                  todo: state.unCompletedTodos[index],
                );
              }),
        ),
      ),
    );
  }
}
