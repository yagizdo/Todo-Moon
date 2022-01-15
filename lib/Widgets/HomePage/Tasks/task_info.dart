import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo({Key? key}) : super(key: key);

  @override
  _Task_InfoState createState() => _Task_InfoState();
}

class _Task_InfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left : 20,right: 20,top: 30),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Consumer<TodosProvider>(
                      builder: (context, state, child) => Text(
                        'You have ${state.unCompletedTodos.length} tasks for today',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            width: 30,
            height: 30,
            color: Colors.white,
            child: const Icon(Icons.calendar_today),
          ),
        ],
      ),
    );
  }
}
