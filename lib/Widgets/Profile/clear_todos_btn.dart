import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class ClearTodosBtn extends StatelessWidget {
  const ClearTodosBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed:
        () {
        if(Provider.of<TodosProvider>(context,listen: false).checkAllTodos() == true) {
          Fluttertoast.showToast(
              msg: "Todo List is Empty",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        } else {
          Provider.of<TodosProvider>(context,listen: false).removeAllTodos();
          print('Button clicked!');
          Fluttertoast.showToast(
              msg: "Deleted All Todos",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.greenAccent,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
    }
      , child: const Text('Clear All Todos',style: TextStyle(fontSize: 10),),
      style: ElevatedButton.styleFrom(primary : Colors.red,shape: const StadiumBorder()),
    );
  }
}
