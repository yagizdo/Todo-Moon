import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
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
          Fluttertoast.showToast(
              msg: "You do not have any completed todo.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: HexColor('#f9f6e8'),
                  title: Text(LocaleKeys.dashboard_alertdialog_title.tr()),
                  content: Text(LocaleKeys.dashboard_alertdialog_subtitle.tr()),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<TodosProvider>(context, listen: false)
                              .removeCompletedTodos();
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                              msg: context.locale == Locale('en')
                                  ? 'Deleted!'
                                  : 'Silindi!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.greenAccent,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child:
                            Text(LocaleKeys.dashboard_alertdialog_delete.tr())),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                              msg: context.locale == Locale('en')
                                  ? 'Cancelled!'
                                  : 'Vazgeçildi!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.orange,
                              textColor: Colors.white,
                              fontSize: 16.0);
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
