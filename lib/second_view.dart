import 'package:flutter/material.dart';
import 'todo_model.dart';

class SecondView extends StatefulWidget {
  final ToDoModell toDo;

  const SecondView(this.toDo, {Key? key}) : super(key: key);

  @override
  State<SecondView> createState() {
    return _SecondViewState(toDo);
  }
}

class _SecondViewState extends State<SecondView> {
  late String titleToDo;
  TextEditingController textEditingController = TextEditingController();

  _SecondViewState(ToDoModell toDo) {
    titleToDo = toDo.titleToDo;
    textEditingController = TextEditingController(text: toDo.titleToDo);

    textEditingController.addListener(() {
      setState(() {
        titleToDo = textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TIG169 TODO'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'What are you going to do?',
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                label: const Text('Add'),
                onPressed: () {
                  if (textEditingController.text.isEmpty) {
                  } else {
                    Navigator.pop(
                        context,
                        ToDoModell(
                          titleToDo: titleToDo,
                        ));
                  }
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
        ));
  }
}
