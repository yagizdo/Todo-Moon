import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Widgets/Todo/edit_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class EditTodo extends StatefulWidget {
  EditTodo({Key? key, required this.todo}) : super(key: key);
  Todo todo;

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  var formKey = GlobalKey<FormState>();
  TextEditingController? titleController;
  TextEditingController? descController;
  TextEditingController? categoryController;

  DateTime? _selectedDate;
  DateTime? _selectedTime;

  late DateTime todoDate;
  late DateTime todoTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.todo.title);
    descController = TextEditingController(text: widget.todo.description);
    categoryController = TextEditingController(text: widget.todo.category);

    todoDate = DateTime.fromMillisecondsSinceEpoch(widget.todo.dateMilliseconds);
    todoTime = DateTime.fromMillisecondsSinceEpoch(widget.todo.timeMilliseconds);
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
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.edittodo_title.tr(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(LocaleKeys.edittodo_close_btn.tr()),
                      ),
                    ],
                  ),
                ),
                EditTF(
                  hint: LocaleKeys.edittodo_title_tf.tr(),
                  controller: titleController!,
                  labelText: LocaleKeys.edittodo_title_tf.tr(),
                ),
                EditTF(
                  hint: LocaleKeys.edittodo_desc_tf.tr(),
                  controller: descController!,
                  labelText: LocaleKeys.edittodo_desc_tf.tr(),
                ),
                EditTF(
                  hint: LocaleKeys.edittodo_category_tf.tr(),
                  controller: categoryController!,
                  labelText: LocaleKeys.edittodo_category_tf.tr(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          icon: const Icon(Icons.calendar_today, size: 18),
                          label: FittedBox(
                            child: _selectedDate == null
                                ? Text(LocaleKeys.edittodo_default_date.tr(args: [
                                    '${todoDate.day.toString().padLeft(2, '0')}.${todoDate.month.toString().padLeft(2, '0')}.${todoDate.year}'
                                  ]))
                                : Text(LocaleKeys.edittodo_selecteddate.tr(args: [
                                    '${_selectedDate?.day.toString().padLeft(2, '0')}.${_selectedDate?.month.toString().padLeft(2, '0')}.${_selectedDate?.year}'
                                  ])),
                          ),
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: todoDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(const Duration(days: 365 * 30)),
                            );
                            if (date != null) {
                              setState(() => _selectedDate = date);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          icon: const Icon(Icons.access_time, size: 18),
                          label: FittedBox(
                            child: _selectedTime == null
                                ? Text(LocaleKeys.edittodo_default_time.tr(args: [
                                    '${todoTime.hour.toString().padLeft(2, '0')}:${todoTime.minute.toString().padLeft(2, '0')}'
                                  ]))
                                : Text(LocaleKeys.edittodo_selectedtime.tr(args: [
                                    '${_selectedTime?.hour.toString().padLeft(2, '0')}:${_selectedTime?.minute.toString().padLeft(2, '0')}'
                                  ])),
                          ),
                          onPressed: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(todoTime),
                            );
                            if (time != null) {
                              setState(() {
                                _selectedTime = DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  time.hour,
                                  time.minute,
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Provider.of<TodosProvider>(context, listen: false).editTodo(
                            widget.todo,
                            titleController!.text,
                            descController!.text,
                            categoryController!.text,
                            _selectedDate?.millisecondsSinceEpoch ?? widget.todo.dateMilliseconds,
                            _selectedTime?.millisecondsSinceEpoch ?? widget.todo.timeMilliseconds,
                          );
                          titleController?.text = '';
                          descController?.text = '';
                          categoryController?.text = '';
                          final messenger = ScaffoldMessenger.of(context);
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          messenger.showSnackBar(
                            const SnackBar(
                              content: Text('Done!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      child: Text(LocaleKeys.edittodo_edit_btn.tr()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
