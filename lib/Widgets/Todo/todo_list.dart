import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Widgets/Todo/todo_card.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosProvider>(
      builder: (context, state, child) => SizedBox(
        height: MediaQuery.of(context).size.height / 2.68,
        child: ListView.builder(
            itemCount: state.unCompletedTodos.where((Todo) {
              return DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                          .day ==
                      DateTime.now().day &&
                  DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                          .month ==
                      DateTime.now().month &&
                  DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                          .year ==
                      DateTime.now().year;
            }).length,
            itemBuilder: (context, index) {
              return TodoCard(
                todo: state.unCompletedTodos.where((Todo) {
                  return DateTime.fromMillisecondsSinceEpoch(
                                  Todo.dateMilliseconds)
                              .day ==
                          DateTime.now().day &&
                      DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                              .month ==
                          DateTime.now().month &&
                      DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                              .year ==
                          DateTime.now().year;
                }).toList()[index],
              );
            }),
      ),
    );
  }
}
