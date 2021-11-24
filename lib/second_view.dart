import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'todo_model.dart';

class SecondView extends StatefulWidget {
  final ToDoModell toDo;

  const SecondView(this.toDo, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(toDo);
  }
}

class SecondViewState extends State<SecondView> {
  late String title;
  late bool done;

  late TextEditingController textEditingController;

  SecondViewState(ToDoModell toDo) {
    title = toDo.title;
    done = toDo.done;

    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      setState(() {
        title = textEditingController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TIG169 TODO', style: GoogleFonts.lora(fontSize: 30.0)),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.lightBlue, Colors.orange])),
          ),
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
                icon: const Icon(Icons.add),
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
                          title: title,
                          done: done,
                        ));
                  }
                },
              )
            ],
          ),
        ));
  }
}
