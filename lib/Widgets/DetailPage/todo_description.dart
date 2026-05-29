import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Models/todo.dart';

class TodoDescription extends StatelessWidget {
  const TodoDescription({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        alignment: Alignment.topCenter,
        child: AutoSizeText(
          todo.description,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
