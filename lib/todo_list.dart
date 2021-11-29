import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_model.dart';

//listan som visas i UIn
class ToDoList extends StatelessWidget {
  final List<ToDoModell> list;
  const ToDoList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ListView(
          children: list.map((toDo) => _toDoItem(toDo, context)).toList()),
    );
  }

  Widget _toDoItem(toDo, context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.blueGrey[50],
      child: ListTile(
        leading: Checkbox(
            value: toDo.done,
            onChanged: (value) {
              Provider.of<ToDoproviderState>(context, listen: false)
                  .isDone(toDo, value);
            }),
        title: Text(toDo.title,
            style: TextStyle(
                fontSize: 20,
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
      ),
    );
  }
}
