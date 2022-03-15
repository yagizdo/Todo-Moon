import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class CompletedTaskInfo extends StatefulWidget {
  const CompletedTaskInfo({Key? key}) : super(key: key);

  @override
  _Task_InfoState createState() => _Task_InfoState();
}

// ignore: camel_case_types
class _Task_InfoState extends State<CompletedTaskInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your tasks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Consumer<TodosProvider>(
                      builder: (context, state, child) => Text(
                        'You have ${state.completedTodos.length} tasks completed all time',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
