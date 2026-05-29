import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Widgets/Todo/custom_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var categoryController = TextEditingController();

  DateTime? _selectedDate;
  DateTime? _selectedTime;

  void saveTodo() {
    Todo todo = Todo(
      title: titleController.text,
      description: descController.text,
      category: categoryController.text,
      dateMilliseconds: _selectedDate?.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      timeMilliseconds: _selectedTime?.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
    );
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
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    LocaleKeys.addtodo_title.tr(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                CustomTF(
                  hint: LocaleKeys.addtodo_title_tf.tr(),
                  controller: titleController,
                  labelText: LocaleKeys.addtodo_title_tf.tr(),
                ),
                CustomTF(
                  hint: LocaleKeys.addtodo_desc_tf.tr(),
                  controller: descController,
                  labelText: LocaleKeys.addtodo_desc_tf.tr(),
                ),
                CustomTF(
                  hint: LocaleKeys.addtodo_category_tf.tr(),
                  controller: categoryController,
                  labelText: LocaleKeys.addtodo_category_tf.tr(),
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
                                ? Text(LocaleKeys.addtodo_date.tr(args: [
                                    '${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year}'
                                  ]))
                                : Text(LocaleKeys.addtodo_selected.tr(args: [
                                    '${_selectedDate?.day.toString().padLeft(2, '0')}/${_selectedDate?.month.toString().padLeft(2, '0')}/${_selectedDate?.year}'
                                  ])),
                          ),
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate ?? DateTime.now(),
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
                                ? Text(LocaleKeys.addtodo_time.tr(args: [
                                    '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}'
                                  ]))
                                : Text(LocaleKeys.addtodo_selected.tr(args: [
                                    '${_selectedTime?.hour.toString().padLeft(2, '0')}:${_selectedTime?.minute.toString().padLeft(2, '0')}'
                                  ])),
                          ),
                          onPressed: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
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
                  padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Consumer<TodosProvider>(
                      builder: (context, state, child) => FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (categoryController.text.isEmpty) {
                              categoryController.text =
                                  context.locale == const Locale('en')
                                      ? 'Uncategorized'
                                      : 'Kategorisiz';
                            }
                            saveTodo();
                            titleController.text = '';
                            descController.text = '';
                            categoryController.text = '';
                            final msg = context.locale == const Locale('en')
                                ? 'Added!'
                                : 'Eklendi!';
                            final messenger = ScaffoldMessenger.of(context);
                            Navigator.pop(context);
                            messenger.showSnackBar(
                              SnackBar(
                                content: Text(msg),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          }
                        },
                        child: Text(LocaleKeys.addtodo_add_btn.tr()),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(LocaleKeys.addtodo_cancel_btn.tr()),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
