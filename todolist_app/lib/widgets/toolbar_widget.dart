import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int onCompletedTodoCount = ref
        .watch(todoListProvider)
        .where((element) => !element.completed)
        .length;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: Text(
        onCompletedTodoCount == 0
            ? "Tüm görevler tamamalandı"
            : onCompletedTodoCount.toString() + "görev tamamlanmadı",
        overflow: TextOverflow.ellipsis,
      )),
      Tooltip(
        message: "All todos",
        child: TextButton(
          onPressed: () {},
          child: const Text("All"),
        ),
      ),
      Tooltip(
        message: "Only uncompleted todos",
        child: TextButton(
          onPressed: () {},
          child: const Text("Active"),
        ),
      ),
      Tooltip(
        message: "Only completed todos",
        child: TextButton(
          onPressed: () {},
          child: const Text("Completed"),
        ),
      ),
    ]);
  }
}
