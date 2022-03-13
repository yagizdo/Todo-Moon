import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Widgets/Todo/custom_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var categoryController = TextEditingController();

  DateTime? _selectedDatetime;

  void saveTodo() {
    Todo todo = Todo(
        title: titleController.text,
        description: descController.text,
        category: categoryController.text,
        dateTime:
            _selectedDatetime?.day.toString() ?? DateTime.now().day.toString());

    Provider.of<TodosProvider>(context, listen: false).addTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Add Task',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTF(
                    hint: 'Title',
                    controller: titleController,
                    labelText: 'Title'),
                CustomTF(
                    hint: 'Description',
                    controller: descController,
                    labelText: 'Description'),
                CustomTF(
                    hint: 'Category',
                    controller: categoryController,
                    labelText: 'Category'),
                ElevatedButton(
                    onPressed: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: CupertinoDatePicker(
                              onDateTimeChanged: (DateTime datetime) {
                            setState(() {
                              _selectedDatetime = datetime;
                              print(datetime);
                            });
                          }),
                        ),
                      );
                    },
                    child: Text('Pick Time')),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 50),
                  child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent),
                          onPressed: () {
                            setState(() {
                              if (formKey.currentState!.validate()) {
                                if (categoryController.text.isEmpty) {
                                  categoryController.text = 'Uncategorized';
                                  saveTodo();
                                  titleController.text = '';
                                  descController.text = '';
                                  categoryController.text = '';
                                  Navigator.pop(context);
                                  Fluttertoast.showToast(
                                      msg: "Added!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  saveTodo();
                                  titleController.text = '';
                                  descController.text = '';
                                  categoryController.text = '';
                                  Navigator.pop(context);
                                  Fluttertoast.showToast(
                                      msg: "Added!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }
                            });
                          },
                          child: const Text('Add Todo'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
