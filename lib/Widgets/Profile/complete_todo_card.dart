import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Pages/detail_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';

class CompleteTodoCard extends StatelessWidget {
  const CompleteTodoCard({required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      title: todo.title,
                      desc: todo.description,
                      category: todo.category,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .toggleTodo(todo);
              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  Provider.of<TodosProvider>(context, listen: false)
                      .toggleTodo(todo);
                },
                backgroundColor: Colors.green,
                label: 'UnComplete!',
              )
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .removeTodo(todo);
              },
            ),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  Provider.of<TodosProvider>(context, listen: false)
                      .removeTodo(todo);
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
