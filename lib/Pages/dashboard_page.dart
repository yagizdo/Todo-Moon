import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/Dashboard/complete_todo_list.dart';
import 'package:todo_app/Widgets/Dashboard/completed_task_info.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _DashboardAppBar(),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: const [CompletedTaskInfo(), CompleteTodoList()],
        ),
      ),
    );
  }
}

class _DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _DashboardAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      title: Text(
        LocaleKeys.dashboard_title.tr(),
        style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
