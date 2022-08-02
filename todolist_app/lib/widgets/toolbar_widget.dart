import 'package:flutter/material.dart';

class ToolBarWidget extends StatelessWidget {
  const ToolBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(child: Text("4 Todos")),
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
