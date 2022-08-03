import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/models/todo_model.dart';
import 'package:todolist_app/providers/all_providers.dart';
import 'package:todolist_app/widgets/title_widget.dart';
import 'package:todolist_app/widgets/todo_list_item_widget.dart';
import 'package:todolist_app/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({Key? key}) : super(key: key);
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(todoListProvider);
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      children: [
        const TitleWidget(),
        TextField(
            controller: newTodoController,
            decoration: InputDecoration(labelText: "Bugün neler yapacaksın?"),
            onSubmitted: (newTodo) {
              ref.read(todoListProvider.notifier).addTodo(newTodo);
            }),
        const SizedBox(
          height: 20,
        ),
        const ToolBarWidget(),
        for (var i = 0; i < allTodos.length; i++)
          Dismissible(
              key: ValueKey(allTodos[i].id),
              onDismissed: (_) {
                ref.read(todoListProvider.notifier).remove(allTodos[i]);
              },
              child: TodoListItemWidget(item: allTodos[i])),
      ],
    ));
  }
}
