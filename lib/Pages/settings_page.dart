import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/change_name_page.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(context.locale == const Locale('en') ? 'Settings' : 'Ayarlar'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Consumer<TodosProvider>(
        builder: (context, state, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () => state.pickImage(context),
                    child: state.profileImage != null
                        ? CircleAvatar(
                            backgroundImage: MemoryImage(state.profileImage!),
                          )
                        : CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            child: Text(
                              state.name.isNotEmpty && state.surname.isNotEmpty
                                  ? '${state.name[0].toUpperCase()}${state.surname[0].toUpperCase()}'
                                  : '?',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                  title: Text(state.name),
                  subtitle: Text(state.surname),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        showDragHandle: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                        ),
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.75,
                          minChildSize: 0.5,
                          maxChildSize: 0.95,
                          expand: false,
                          builder: (context, scrollController) => const ChangeNameScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                LocaleKeys.profile_stats.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: LocaleKeys.profile_completed_text.tr(),
                      value: '${state.completedTodos.length}',
                      color: Theme.of(context).colorScheme.primaryContainer,
                      textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatCard(
                      label: LocaleKeys.profile_uncompleted_text.tr(),
                      value: '${state.unCompletedTodos.length}',
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      textColor: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _StatCard(
                label: LocaleKeys.profile_alltasks_text.tr(),
                value: '${state.allTodos.length}',
                color: Theme.of(context).colorScheme.tertiaryContainer,
                textColor: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
              const SizedBox(height: 24),
              Text(
                context.locale == const Locale('en') ? 'Preferences' : 'Tercihler',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(context.locale == const Locale('en') ? 'Language' : 'Dil'),
                      subtitle: Text(context.locale == const Locale('en') ? 'English' : 'Türkçe'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        final newLocale = context.locale == const Locale('en')
                            ? const Locale('tr')
                            : const Locale('en');
                        context.setLocale(newLocale);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.color,
    required this.textColor,
  });

  final String label;
  final String value;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
