import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

import "string_extension.dart";

class NameText extends StatelessWidget {
  const NameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Consumer<TodosProvider>(
        builder: (context, state, child) => Text(
          '${state.name.toTitleCase()} ${state.surname.toTitleCase()}',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
