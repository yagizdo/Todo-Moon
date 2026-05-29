import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/greetings.dart';
import 'package:todo_app/Widgets/HomePage/Info/info_widget.dart';
import 'package:todo_app/Widgets/HomePage/Tasks/task_info.dart';
import 'package:todo_app/Widgets/Todo/todo_card.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

enum _TodoFilter { all, active, completed }

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  _TodoFilter _filter = _TodoFilter.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Greetings(),
            const InfoWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  FilterChip(
                    label: Text(context.locale == const Locale('en') ? 'All' : 'Tümü'),
                    selected: _filter == _TodoFilter.all,
                    onSelected: (_) => setState(() => _filter = _TodoFilter.all),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text(context.locale == const Locale('en') ? 'Active' : 'Aktif'),
                    selected: _filter == _TodoFilter.active,
                    onSelected: (_) => setState(() => _filter = _TodoFilter.active),
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: Text(context.locale == const Locale('en') ? 'Completed' : 'Tamamlanan'),
                    selected: _filter == _TodoFilter.completed,
                    onSelected: (_) => setState(() => _filter = _TodoFilter.completed),
                  ),
                  if (_filter == _TodoFilter.completed)
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.delete_sweep, color: Colors.red),
                          onPressed: () => _showClearCompletedDialog(context),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (_filter == _TodoFilter.all) const TaskInfo(),
            Expanded(
              child: Consumer<TodosProvider>(
                builder: (context, state, child) {
                  final todos = switch (_filter) {
                    _TodoFilter.all => state.unCompletedTodos.where((todo) {
                        return DateTime.fromMillisecondsSinceEpoch(todo.dateMilliseconds).day == DateTime.now().day &&
                            DateTime.fromMillisecondsSinceEpoch(todo.dateMilliseconds).month == DateTime.now().month &&
                            DateTime.fromMillisecondsSinceEpoch(todo.dateMilliseconds).year == DateTime.now().year;
                      }).toList(),
                    _TodoFilter.active => state.unCompletedTodos.toList(),
                    _TodoFilter.completed => state.completedTodos.toList(),
                  };

                  if (todos.isEmpty) {
                    return Center(
                      child: Text(
                        context.locale == const Locale('en') ? 'No tasks' : 'Görev yok',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) => TodoCard(todo: todos[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showClearCompletedDialog(BuildContext context) {
    if (Provider.of<TodosProvider>(context, listen: false).checkCompletedTodos()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.locale == const Locale('en')
              ? 'You do not have any completed todo.'
              : 'Tamamlanmış göreviniz yok.'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 1),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.dashboard_alertdialog_title.tr()),
        content: Text(LocaleKeys.dashboard_alertdialog_subtitle.tr()),
        actions: [
          FilledButton(
            onPressed: () {
              Provider.of<TodosProvider>(context, listen: false).removeCompletedTodos();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.locale == const Locale('en') ? 'Deleted!' : 'Silindi!'),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            child: Text(LocaleKeys.dashboard_alertdialog_delete.tr()),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(LocaleKeys.dashboard_alertdialog_cancel.tr()),
          ),
        ],
      ),
    );
  }
}
