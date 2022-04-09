import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

import 'complete_todo_card.dart';

class CompleteTodoList extends StatefulWidget {
  const CompleteTodoList({Key? key}) : super(key: key);

  @override
  _CompleteTodoListState createState() => _CompleteTodoListState();
}

class _CompleteTodoListState extends State<CompleteTodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Consumer<TodosProvider>(
        builder: (context, state, child) => SizedBox(
          height: MediaQuery.of(context).size.height / 1.65,
          child: ListView.builder(
              itemCount: state.completedTodos.length,
              itemBuilder: (context, index) {
                return CompleteTodoCard(
                  todo: state.completedTodos[index],
                );
              }),
        ),
      ),
    );
  }
}
