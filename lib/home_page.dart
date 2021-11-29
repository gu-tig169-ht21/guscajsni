import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'second_view.dart';
import 'todo_list.dart';
import 'todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Object filtervalue = 1;
  //filtervalue används för att kunna visa vilket filtreringsvärde som är valt

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              //tog bort min floatingactionbutton och la den uppe i appbaren istället för att den inte ska vara ivägen för
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
          title: const Text('TIG169 TODO'),
          actions: [
            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  //valde att göra en dropdownn för att kunna visa det valda filtreringsvärdet
                  iconEnabledColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.blueGrey,
                  value: filtervalue,
                  onChanged: (value) {
                    Provider.of<ToDoproviderState>(context, listen: false)
                        .setFilterBy(value!); // filtererar vyn
                    setState(() {
                      filtervalue =
                          value; //byter texten till det valda filtreringsvärdet
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      child: SizedBox(
                          width: 59,
                          child: Text(
                            'All',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.right,
                          )),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: SizedBox(
                          width: 59,
                          child: Text('Done',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.right)),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: SizedBox(
                          width: 59,
                          child: Text('Undone',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.right)),
                      value: 3,
                    )
                  ],
                ),
              ),
            )
          ],
          flexibleSpace: Container(
            //gör appbaren gradient
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.lightBlue, Colors.pink])),
          ),
        ),
        body: Container(
          color: Colors.blueGrey[400],
          child: Consumer<ToDoproviderState>(
              builder: (context, state, child) =>
                  ToDoList(_filterList(state.list, state.filterBy))),
          //visar listan på todos efter filtrering
        ));
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
