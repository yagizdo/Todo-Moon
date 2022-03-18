import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/Models/todo.dart';

import 'edit_todo.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    DateTime todoDate =
        DateTime.fromMillisecondsSinceEpoch(todo.dateMilliseconds);
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => SizedBox(
                  height:
                      // for iphone 11
                      constraints.maxHeight == 896 ||
                              constraints.maxHeight == 926
                          ? MediaQuery.of(context).size.height / 1.6
                          :
                          // For iphone 11 pro, 12 mini
                          constraints.maxHeight == 812
                              ? MediaQuery.of(context).size.height / 1.5
                              : MediaQuery.of(context).size.height / 1.3,
                  child: EditTodo(
                    todo: todo,
                  )),
            );
          },
          child: Icon(Icons.edit),
          backgroundColor: Colors.orangeAccent,
        ),
        backgroundColor: HexColor('#f9f6e8'),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: categoryText(todo.category, context),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),
                      AutoSizeText(
                        todo.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 90, right: 20, top: 10),
                      child: AutoSizeText(
                        '${todoDate.day.toString().padLeft(2, '0')}.${todoDate.month.toString().padLeft(2, '0')}.${todoDate.year}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30, left: 10.0),
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 15),
                          child: Text(
                            todo.description.isEmpty
                                ? 'Desc is empty'
                                : todo.description,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget categoryText(String categoryName, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 30,
    width: MediaQuery.of(context).size.width / 2.7,
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
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
      )),
    ),
  );
}
