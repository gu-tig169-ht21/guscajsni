import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'second_view.dart';
import 'todo_list.dart';
import 'todo_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Object filtervalue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                var newToDo = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondView(ToDoModell(title: 'title'))));
                if (newToDo != null) {
                  Provider.of<ToDoproviderState>(context, listen: false)
                      .addToDo(newToDo);
                }
              },
              icon: const Icon(Icons.add)),
          centerTitle: true,
          title: Text('TIG169 TODO', style: GoogleFonts.lora(fontSize: 20.0)),
          actions: [
            DropdownButton(
              iconEnabledColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              dropdownColor: Colors.grey,
              value: filtervalue,
              onChanged: (value) {
                Provider.of<ToDoproviderState>(context, listen: false)
                    .setFilterBy(value!);
                setState(() {
                  filtervalue = value;
                });
              },
              items: [
                DropdownMenuItem(
                  child: SizedBox(
                      width: 70,
                      child: Text(
                        'All',
                        style: GoogleFonts.lora(color: Colors.white),
                        textAlign: TextAlign.right,
                      )),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: SizedBox(
                      width: 70,
                      child: Text('Done',
                          style: GoogleFonts.lora(color: Colors.white),
                          textAlign: TextAlign.right)),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: SizedBox(
                      width: 70,
                      child: Text('Undone',
                          style: GoogleFonts.lora(color: Colors.white),
                          textAlign: TextAlign.right)),
                  value: 3,
                )
              ],
            )
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.lightBlue, Colors.orange])),
          ),
        ),
        body: Consumer<ToDoproviderState>(
            builder: (context, state, child) =>
                ToDoList(_filterList(state.list, state.filterBy))));
  }

  List<ToDoModell> _filterList(list, filterBy) {
    if (filterBy == 2) {
      return list.where((item) => item.done == true).toList();
    } else if (filterBy == 3) {
      return list.where((item) => item.done == false).toList();
    }
    return list;
  }
}
