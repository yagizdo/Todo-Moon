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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosProvider>(
      builder: (context, state, child) => SizedBox(
        height: MediaQuery.of(context).size.height / 2.68,
        child: ListView.builder(
            itemCount: state.unCompletedTodos
                .where((Todo) => Todo.dateTime == DateTime.now().day.toString())
                .length,
            itemBuilder: (context, index) {
              return TodoCard(
                todo: state.unCompletedTodos
                    .where((Todo) =>
                        Todo.dateTime == DateTime.now().day.toString())
                    .toList()[index],
              );
            }),
      ),
    );
  }
}
