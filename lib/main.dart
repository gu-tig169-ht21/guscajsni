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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text('TIG169 TODO', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(
              Icons.check_box,
              color: Colors.black,
            ),
            title: Text(
              'Städa',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black,
                  fontSize: 20),
            ),
            trailing: Icon(Icons.close, color: Colors.black),
          ),
          ListTile(
            leading: Icon(
              Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            title: Text(
              'Plugga',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            trailing: Icon(Icons.close, color: Colors.black),
          ),
          ListTile(
            leading: Icon(
              Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            title: Text(
              'Laga mat',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            trailing: Icon(Icons.close, color: Colors.black),
          ),
          ListTile(
            leading: Icon(
              Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            title: Text(
              'Betala räkningar',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            trailing: Icon(Icons.close, color: Colors.black),
          )
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

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

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
