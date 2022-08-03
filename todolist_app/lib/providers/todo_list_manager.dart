import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager([List<TodoModel>? initialTodos]) : super(initialTodos ?? []);

  void addTodo(String description) {
    var eklenecekTodo = TodoModel(id: Uuid().v4(), description: description);
    //state'i güncelliyoruz
    // ...state bir önceki state demek

    state = [...state, eklenecekTodo];
    //bir önceki liste ile eklenecek todoyu birleştirmiş olduk
  }

  void toggle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              description: todo.description,
              completed: !todo.completed)
        else
          todo,
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              description: newDescription,
              completed: todo.completed)
        else
          todo,
    ];
  }

  void remove(TodoModel silinecekTodo) {
    state = state.where((element) => element.id != silinecekTodo.id).toList();
  }

  int onCompletedTodoCount() {
    return state.where((element) => !element.completed).length;
  }
}
