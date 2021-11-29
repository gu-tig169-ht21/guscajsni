import 'package:flutter/material.dart';
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
  late String empty = '';

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
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('TIG169 TODO'),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.lightBlue, Colors.pink])),
            ),
          ),
          body: Container(
            color: Colors.blueGrey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        empty = '';
                      });
                      //använder detta för att nollställa varningstexten som dyker upp
                      //när man försöker lägga till en tom todo
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(fontSize: 20),
                    controller: textEditingController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: textEditingController.clear,
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.black,
                          )),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Colors.black, width: 1.0)),
                      hintText: 'What is your next todo?',
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  label: const Text(
                    'Add',
                    style: TextStyle(fontSize: 17),
                  ),
                  onPressed: () {
                    //dessa rader gör så att textfield avmarkeras när man
                    //försöker lägga till en tom todo för att varningstexten
                    //ska försvinna när man trycker på textfield igen
                    if (textEditingController.text.isEmpty) {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      setState(() {
                        empty = 'Can\'t be empty';
                      });
                    } else {
                      //är textfield inte tomt läggs den nya todon in i listan
                      Navigator.pop(
                          context,
                          ToDoModell(
                            title: title,
                            done: done,
                          ));
                    }
                  },
                ),
                Text(
                    empty, //texten som dyker upp när man försöker lägga till tom todo
                    style: const TextStyle(color: Colors.red, fontSize: 15))
              ],
            ),
          )),
    );
  }
}
