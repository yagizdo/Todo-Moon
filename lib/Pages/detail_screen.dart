import 'package:flutter/material.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Widgets/DetailPage/todo_description.dart';

import '../Widgets/DetailPage/todo_info_section.dart';
import 'edit_todo.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.85,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              expand: false,
              builder: (_, __) => EditTodo(todo: todo),
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          Icons.edit,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: TodoInfoSection(todo: todo),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TodoDescription(todo: todo),
            ),
          ),
        ],
      ),
    );
  }
}
