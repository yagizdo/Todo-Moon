import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

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
                  title: const Text('Are you sure?'),
                  content: const Text(
                      'You do realize that all todos you complete will be deleted, right?'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<TodosProvider>(context, listen: false)
                              .removeCompletedTodos();
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                              msg: "Deleted!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.greenAccent,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: const Text('Delete completed todos!')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                              msg: "Canceled!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.orange,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: const Text('Cancel')),
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
