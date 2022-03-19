import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
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
  String dateTextValue =
      '${DateTime.now().day}:${DateTime.now().month.toString().padLeft(2, '0')}:${DateTime.now().year}';

  void saveTodo() {
    Todo todo = Todo(
        title: titleController.text,
        description: descController.text,
        category: categoryController.text,
        dateMilliseconds: _selectedDatetime?.millisecondsSinceEpoch ??
            DateTime.now().millisecondsSinceEpoch);
    Provider.of<TodosProvider>(context, listen: false).addTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Form(
          key: formKey,
          child: Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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

                    // Cupertino DatwTime Picker
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          context: context,
                          builder: (context) => Container(
                              color: HexColor('#f9f6e8'),
                              height: MediaQuery.of(context).size.height / 1.8,
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 10,
                                      child: CupertinoDatePicker(
                                          minimumYear: 2022,
                                          maximumYear:
                                              (DateTime.now().year + 30),
                                          minimumDate: DateTime.now(),
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: (datetime) {
                                            setState(() {
                                              _selectedDatetime = datetime;
                                            });
                                          })),
                                  Expanded(
                                      flex: 2,
                                      child: CupertinoButton(
                                          child: const Text(
                                            'Ok',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }))
                                ],
                              )),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 12,
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: _selectedDatetime == null
                            ? Text(
                                'Selected Date : ${DateTime.now().day.toString().padLeft(2, '0')}.${DateTime.now().month.toString().padLeft(2, '0')}.${DateTime.now().year}')
                            : Text(
                                'Selected Date : ${_selectedDatetime?.day.toString().padLeft(2, '0')}.${_selectedDatetime?.month.toString().padLeft(2, '0')}.${_selectedDatetime?.year}'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 40),
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
                Positioned(
                  top: 90,
                  right: 10,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
