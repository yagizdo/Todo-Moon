import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Widgets/Todo/edit_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';

class EditTodo extends StatefulWidget {
  EditTodo({Key? key, required this.todo}) : super(key: key);
  Todo todo;

  @override
  _EditTodoState createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  var formKey = GlobalKey<FormState>();
  var titleController;
  var descController;
  var categoryController;

  DateTime? _selectedDatetime;
  String dateTextValue =
      '${DateTime.now().day}:${DateTime.now().month.toString().padLeft(2, '0')}:${DateTime.now().year}';

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.todo.title);
    descController = TextEditingController(text: widget.todo.description);
    categoryController = TextEditingController(text: widget.todo.category);
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
                        'Edit Todo',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    EditTF(
                        hint: 'Title',
                        controller: titleController,
                        labelText: 'Title'),
                    EditTF(
                        hint: 'Description',
                        controller: descController,
                        labelText: 'Description'),
                    EditTF(
                        hint: 'Category',
                        controller: categoryController,
                        labelText: 'Category'),

                    // Cupertino DatwTime Picker
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                              color: HexColor('#f9f6e8'),
                              height: MediaQuery.of(context).size.height / 1.4,
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: CupertinoDatePicker(
                                          initialDateTime: DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  widget.todo.dateMilliseconds),
                                          minimumYear: 2022,
                                          maximumYear:
                                              (DateTime.now().year + 30),
                                          minimumDate: DateTime.now()
                                              .subtract(Duration(hours: 1)),
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: (datetime) {
                                            setState(() {
                                              _selectedDatetime = datetime;
                                            });
                                          })),
                                  Expanded(
                                    flex: 1,
                                    child: CupertinoButton(
                                        child: const Text('Ok'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                  )
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

                    // Edit button
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
                                    Provider.of<TodosProvider>(context,
                                            listen: false)
                                        .editTodo(
                                            widget.todo,
                                            titleController.text,
                                            descController.text,
                                            categoryController.text,
                                            _selectedDatetime
                                                        ?.millisecondsSinceEpoch ==
                                                    null
                                                ? widget.todo.dateMilliseconds
                                                : _selectedDatetime!
                                                    .millisecondsSinceEpoch);

                                    titleController.text = '';
                                    descController.text = '';
                                    categoryController.text = '';
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                    Fluttertoast.showToast(
                                        msg: "Done!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                });
                              },
                              child: const Text('Edit Todo'))),
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
