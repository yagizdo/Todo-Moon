import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Widgets/Todo/edit_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class EditTodo extends StatefulWidget {
  EditTodo({Key? key, required this.todo}) : super(key: key);
  Todo todo;

  @override
  _EditTodoState createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  var formKey = GlobalKey<FormState>();
  TextEditingController? titleController;
  TextEditingController? descController;
  TextEditingController? categoryController;

  DateTime? _selectedDate;
  DateTime? _selectedTime;
  String dateTextValue =
      '${DateTime.now().day}:${DateTime.now().month.toString().padLeft(2, '0')}:${DateTime.now().year}';

  var todoDate;
  var todoTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.todo.title);
    descController = TextEditingController(text: widget.todo.description);
    categoryController = TextEditingController(text: widget.todo.category);

    todoDate =
        DateTime.fromMillisecondsSinceEpoch(widget.todo.dateMilliseconds);
    todoTime =
        DateTime.fromMillisecondsSinceEpoch(widget.todo.timeMilliseconds);
  }

  @override
  void dispose() {
    titleController?.dispose();
    categoryController?.dispose();
    descController?.dispose();
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
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Text(
                        LocaleKeys.edittodo_title.tr(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    EditTF(
                        hint: LocaleKeys.edittodo_title_tf.tr(),
                        controller: titleController!,
                        labelText: LocaleKeys.edittodo_title_tf.tr()),
                    EditTF(
                        hint: LocaleKeys.edittodo_desc_tf.tr(),
                        controller: descController!,
                        labelText: LocaleKeys.edittodo_desc_tf.tr()),
                    EditTF(
                        hint: LocaleKeys.edittodo_category_tf.tr(),
                        controller: categoryController!,
                        labelText: LocaleKeys.edittodo_category_tf.tr()),

                    Row(
                      children: [
                        // Cupertino DatwTime Picker
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          // DATE
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 14,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                                          MediaQuery.of(context).size.height /
                                              1.8,
                                      child: Column(
                                        children: [
                                          Expanded(
                                              flex: 10,
                                              child: CupertinoDatePicker(
                                                  initialDateTime: DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          widget.todo
                                                              .dateMilliseconds),
                                                  minimumYear: 2022,
                                                  maximumYear:
                                                      (DateTime.now().year +
                                                          30),
                                                  minimumDate: DateTime.fromMillisecondsSinceEpoch(
                                                                      // 18
                                                                      widget.todo.dateMilliseconds)
                                                                  .day !=
                                                              DateTime.now()
                                                                  .day // 19
                                                          &&
                                                          DateTime.fromMillisecondsSinceEpoch(
                                                                      widget
                                                                          .todo
                                                                          .dateMilliseconds)
                                                                  .day >=
                                                              DateTime.now().day
                                                      ? DateTime.now()
                                                      : todoDate,
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  onDateTimeChanged: (datetime) {
                                                    setState(() {
                                                      _selectedDate = datetime;
                                                    });
                                                  })),
                                          Expanded(
                                            flex: 2,
                                            child: CupertinoButton(
                                                child: Text(
                                                  context.locale == Locale('en')
                                                      ? 'Ok'
                                                      : 'Tamam',
                                                  style:
                                                      TextStyle(fontSize: 25),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                }),
                                          )
                                        ],
                                      )),
                                );
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  child: FittedBox(
                                    child: _selectedDate == null
                                        ? Text(LocaleKeys.edittodo_default_date
                                            .tr(args: [
                                            '${todoDate.day.toString().padLeft(2, '0')}.${todoDate.month.toString().padLeft(2, '0')}.${todoDate.year}'
                                          ]))
                                        : Text(LocaleKeys.edittodo_selecteddate
                                            .tr(args: [
                                            '${_selectedDate?.day.toString().padLeft(2, '0')}.${_selectedDate?.month.toString().padLeft(2, '0')}.${_selectedDate?.year}'
                                          ])),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          // TIME
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 14,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                                  builder: (context) => Column(
                                    children: [
                                      Expanded(
                                          flex: 10,
                                          child: CupertinoDatePicker(
                                              use24hFormat: true,
                                              initialDateTime: DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      widget.todo
                                                          .timeMilliseconds),
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
                                            child: Text(
                                              context.locale == Locale('en')
                                                  ? 'Ok'
                                                  : 'Tamam',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  child: FittedBox(
                                    child: _selectedTime == null
                                        ? Text(LocaleKeys.edittodo_default_time
                                            .tr(args: [
                                            '${todoTime.hour.toString().padLeft(2, '0')}:${todoTime.minute.toString().padLeft(2, '0')}'
                                          ]))
                                        : Text(LocaleKeys.edittodo_selectedtime
                                            .tr(args: [
                                            '${_selectedTime?.hour.toString().padLeft(2, '0')}:${_selectedTime?.minute.toString().padLeft(2, '0')}'
                                          ])),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
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
                                            titleController!.text,
                                            descController!.text,
                                            categoryController!.text,
                                            _selectedDate
                                                        ?.millisecondsSinceEpoch ==
                                                    null
                                                ? widget.todo.dateMilliseconds
                                                : _selectedDate!
                                                    .millisecondsSinceEpoch,
                                            _selectedTime
                                                        ?.millisecondsSinceEpoch ==
                                                    null
                                                ? widget.todo.timeMilliseconds
                                                : _selectedTime!
                                                    .millisecondsSinceEpoch);

                                    titleController?.text = '';
                                    descController?.text = '';
                                    categoryController?.text = '';
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
                              child: Text(LocaleKeys.edittodo_edit_btn.tr()))),
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
                      child: Text(LocaleKeys.edittodo_close_btn.tr())),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
