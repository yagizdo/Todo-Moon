import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo({Key? key}) : super(key: key);

  @override
  _Task_InfoState createState() => _Task_InfoState();
}

// ignore: camel_case_types
class _Task_InfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your tasks',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Consumer<TodosProvider>(
                      builder: (context, state, child) => Text(
                        'You have ${state.unCompletedTodos.where((Todo) => DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).day == DateTime.now().day).length} tasks for today',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: const Icon(Icons.calendar_today),
            ),
          ),
        ],
      ),
    );
  }
}
