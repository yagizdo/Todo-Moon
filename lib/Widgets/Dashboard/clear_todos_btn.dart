import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class ClearTodosBtn extends StatelessWidget {
  const ClearTodosBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (Provider.of<TodosProvider>(context, listen: false)
                .checkCompletedTodos() ==
            true) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("You do not have any completed todo."), backgroundColor: Colors.red, duration: Duration(seconds: 1)));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  title: Text(LocaleKeys.dashboard_alertdialog_title.tr()),
                  content: Text(LocaleKeys.dashboard_alertdialog_subtitle.tr()),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<TodosProvider>(context, listen: false)
                              .removeCompletedTodos();
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(context.locale == Locale('en') ? 'Deleted!' : 'Silindi!'),
                                backgroundColor: Colors.greenAccent,
                                duration: const Duration(seconds: 1),
                              ));
                        },
                        child:
                            Text(LocaleKeys.dashboard_alertdialog_delete.tr())),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(context.locale == Locale('en') ? 'Cancelled!' : 'Vazgeçildi!'),
                                backgroundColor: Colors.orange,
                                duration: const Duration(seconds: 1),
                              ));
                        },
                        child:
                            Text(LocaleKeys.dashboard_alertdialog_cancel.tr())),
                  ],
                );
              });
        }
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 25,
      ),
    );
  }
}
