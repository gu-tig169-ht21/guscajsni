import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_model.dart';

class ToDoList extends StatelessWidget {
  final List<ToDoModell> list;
  const ToDoList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((toDo) => _toDoItem(toDo, context)).toList());
  }

  Widget _toDoItem(toDo, context) {
    return ListTile(
      leading: Checkbox(
          value: toDo.done,
          onChanged: (value) {
            Provider.of<ToDoproviderState>(context, listen: false)
                .isDone(toDo, value);
          }),
      title: Text(toDo.title,
          style: TextStyle(
              decoration: toDo.done
                  ? TextDecoration.lineThrough
                  : TextDecoration.none)),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Provider.of<ToDoproviderState>(context, listen: false)
              .removeToDo(toDo);
        },
      ),
    );
  }
}
