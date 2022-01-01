import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Pages/detail_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(title: todo.title, desc: todo.description)));
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Card(
          shadowColor: Colors.transparent,
          color: Colors.white,
          elevation: 20,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Checkbox(
                      value: todo.complete,
                      onChanged: (bool? value) {
                        Provider.of<TodosProvider>(context, listen: false).toggleTodo(todo);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        categoryText(todo.category),
                        titleText(todo.title),
                      ],
                    ),
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
