import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  List<String> attgoralista = ['Städa', 'Laga mat', 'fiska'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('TIG169 TODO'),
        actions: <Widget>[
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      // visa alla
                      child: Text('Alla'),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      // sortera efter checked box items
                      //onTap: ,
                      child: Text('Avklarade'),
                      value: 2,
                    ),
                    const PopupMenuItem(
                      // sortera efter unchecked box items
                      // onTap: ,
                      child: Text('Kvarvarande'),
                      value: 3,
                    )
                  ])
        ],
      ),
      body: ListView(
        children: <Widget>[
          attGora('Städa'),
          attGora('Laga Mat'),
          attGora('Fiska')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 58.0,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SecondView()));
        },
        backgroundColor: Colors.grey,
      ),
    );
  }
}

Widget attGora(text) {
  return ListTile(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.check_box_outline_blank),
      ),
      title: Text(text),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.close)));
}

class SecondView extends StatefulWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: Colors.grey,
          centerTitle: true,
          title:
              const Text('TIG169 TODO', style: TextStyle(color: Colors.black))),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Vad vill du lägga till?',
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
              onPressed: () {},
              label: const Text('Lägg till'),
              icon: const Icon(Icons.add),
            )
          ])),
    );
  }
}
