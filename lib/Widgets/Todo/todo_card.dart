import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Pages/detail_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({required this.todo,String? key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future(() {
          //Navigator.push(context,MaterialPageRoute(builder: (context) => DetailScreen(title: todo.title, desc: todo.description, category: todo.category)));
          showBarModalBottomSheet(context: context,
              builder: (context) => DetailScreen(title: todo.title, desc: todo.description, category: todo.category));
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .toggleTodo(todo);
                Fluttertoast.showToast(
                    msg: "Done!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  Provider.of<TodosProvider>(context, listen: false)
                      .toggleTodo(todo);
                  Fluttertoast.showToast(
                      msg: "Done!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                backgroundColor: Colors.green,
                label: 'Done!',
              )
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .removeTodo(todo);
                Fluttertoast.showToast(
                    msg: "Uncompleted!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  Provider.of<TodosProvider>(context, listen: false)
                      .removeTodo(todo);
                  Fluttertoast.showToast(
                      msg: "Removed!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                backgroundColor: Colors.red,
                label: 'Remove!',
              )
            ],
          ),
          child: Card(
            shadowColor: Colors.transparent,
            color: Colors.white,
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      child: Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          shape: const CircleBorder(),
                          checkColor: Colors.white,
                          activeColor: Colors.black,
                          value: todo.complete,
                          onChanged: (bool? value) {
                            Provider.of<TodosProvider>(context, listen: false)
                                .toggleTodo(todo);
                            Fluttertoast.showToast(
                                msg: "Done!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      categoryText(todo.category),
                      titleText(todo.title),
                    ],
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget categoryText(String categoryName) {
  return Container(
    height: 18,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: HexColor('#d3e3f2'),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
          child: Text(
        categoryName,
        style: const TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 10),
      )),
    ),
  );
}

Widget titleText(String titleName) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Center(
        child: Text(
      titleName,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
    )),
  );
}
