import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

import "string_extension.dart";

class NameText extends StatelessWidget {
  const NameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Consumer<TodosProvider>(
          builder: (context, state, child) => AutoSizeText(
            '${state.name.toTitleCase()} ${state.surname.toTitleCase()}',
            maxLines: 1,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
