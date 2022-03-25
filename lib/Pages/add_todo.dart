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

  DateTime? _selectedDate;
  DateTime? _selectedTime;
  String dateTextValue =
      '${DateTime.now().day}:${DateTime.now().month.toString().padLeft(2, '0')}:${DateTime.now().year}';

  void saveTodo() {
    Todo todo = Todo(
        title: titleController.text,
        description: descController.text,
        category: categoryController.text,
        dateMilliseconds: _selectedDate?.millisecondsSinceEpoch ??
            DateTime.now().millisecondsSinceEpoch,
        timeMilliseconds: _selectedTime?.millisecondsSinceEpoch ??
            DateTime.now().millisecondsSinceEpoch);
    Provider.of<TodosProvider>(context, listen: false).addTodo(todo);
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    categoryController.dispose();
    super.dispose();
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25.0),
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
                Row(
                  children: [
                    // Cupertino DateTime Picker
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 13,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amber.shade800),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            showCupertinoModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              context: context,
                              builder: (context) => Container(
                                color: HexColor('#f9f6e8'),
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 10,
                                        child: CupertinoDatePicker(
                                            minimumYear: 2022,
                                            maximumYear:
                                                (DateTime.now().year + 30),
                                            minimumDate: _selectedDate == null
                                                ? DateTime.now()
                                                : _selectedDate!.day <=
                                                        DateTime.now().day
                                                    ? _selectedDate
                                                    : DateTime.now(),
                                            initialDateTime:
                                                _selectedDate ?? DateTime.now(),
                                            mode: CupertinoDatePickerMode.date,
                                            onDateTimeChanged: (datetime) {
                                              setState(() {
                                                _selectedDate = datetime;
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
                                ),
                              ),
                            );
                          },
                          child: FittedBox(
                            child: _selectedDate == null
                                ? Text(
                                    'Select Date \n(Default Date: ${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year})',
                                    textAlign: TextAlign.center,
                                  )
                                : Text(
                                    'Selected: ${_selectedDate?.day.toString().padLeft(2, '0')}/${_selectedDate?.month.toString().padLeft(2, '0')}/${_selectedDate?.year}'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 13,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amber.shade800),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                            ),
                          ),
                          child: FittedBox(
                            child: _selectedTime == null
                                ? Text(
                                    'Select Time \n(Default time : ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')})     ',
                                    textAlign: TextAlign.center,
                                  )
                                : Text(
                                    'Selected: ${_selectedTime?.hour.toString().padLeft(2, '0')}.${_selectedTime?.minute.toString().padLeft(2, '0')}'),
                          ),
                          onPressed: () {
                            showCupertinoModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              context: context,
                              builder: (context) => Container(
                                  color: HexColor('#f9f6e8'),
                                  height:
                                      MediaQuery.of(context).size.height / 1.8,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 10,
                                          child: CupertinoDatePicker(
                                              use24hFormat: true,
                                              mode:
                                                  CupertinoDatePickerMode.time,
                                              onDateTimeChanged: (datetime) {
                                                setState(() {
                                                  _selectedTime = datetime;
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
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amber.shade600),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            )),
                          ),
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
