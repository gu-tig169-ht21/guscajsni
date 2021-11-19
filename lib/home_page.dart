import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'second_view.dart';
import 'todo_list.dart';
import 'todo_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TIG169 TODO'),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                Provider.of<ToDoListproviderState>(context, listen: false)
                    .setFilterBy(value!);
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text('All'),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text('Done'),
                      value: 2,
                    ),
                    const PopupMenuItem(
                      child: Text('Undone'),
                      value: 3,
                    )
                  ])
        ],
      ),
      body: Consumer<ToDoListproviderState>(
          builder: (context, state, child) =>
              ToDoList(_filterList(state.list, state.filterBy))),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        child: const Icon(Icons.add, size: 55.0),
        onPressed: () async {
          var newToDo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondView(ToDoModell(titleToDo: ''))));

          if (newToDo != null) {
            Provider.of<ToDoListproviderState>(context, listen: false)
                .addToDo(newToDo);
          }
        },
      ),
    );
  }

  List<ToDoModell> _filterList(list, filterBy) {
    if (filterBy == 2) {
      return list.where((item) => item.isDone == true).toList();
    } else if (filterBy == 3) {
      return list.where((item) => item.isDone == false).toList();
    }
    return list;
  }
}
