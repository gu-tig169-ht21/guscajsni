import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_model.dart';

class ToDoList extends StatefulWidget {
  final List<ToDoModell> list;

  const ToDoList(this.list, {Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: widget.list.map((toDo) => _toDoItem(toDo, context)).toList());
  }

  Widget _toDoItem(toDo, context) {
    return ListTile(
      leading: Checkbox(
        value: toDo.isDone,
        onChanged: (bool? value) {
          setState(() {
            toDo.isDone = value!;
          });
        },
      ),
      title: Text(toDo.titleToDo,
          style: TextStyle(
              decoration: toDo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none)),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Provider.of<ToDoListproviderState>(context, listen: false)
              .removeToDo(toDo);
        },
      ),
    );
  }
}
