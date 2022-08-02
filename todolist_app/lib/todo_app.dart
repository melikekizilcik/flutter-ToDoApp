import 'package:flutter/material.dart';
import 'package:todolist_app/models/todo_model.dart';
import 'package:todolist_app/widgets/title_widget.dart';
import 'package:todolist_app/widgets/todo_list_item_widget.dart';
import 'package:todolist_app/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);
  final newTodoController = TextEditingController();
  List<TodoModel> allTodos = [
    TodoModel(id: const Uuid().v4(), description: "Spora git"),
    TodoModel(id: const Uuid().v4(), description: "Ders Çalış"),
    TodoModel(id: const Uuid().v4(), description: "Alışveriş yap")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      children: [
        const TitleWidget(),
        TextField(
            controller: newTodoController,
            decoration: InputDecoration(labelText: "Bugün neler yapacaksın?"),
            onSubmitted: (newTodo) {
              debugPrint("şunu ekle $newTodo");
            }),
        const SizedBox(
          height: 20,
        ),
        const ToolBarWidget(),
        for (var i = 0; i < allTodos.length; i++)
          Dismissible(
              key: ValueKey(allTodos[i].id),
              onDismissed: (_){

              },
              child: TodoListItemWidget(item: allTodos[i])),
      ],
    ));
  }
}
