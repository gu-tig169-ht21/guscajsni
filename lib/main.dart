import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.black,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('TIG169 TODO'),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onPressed: (//funktionen för sorteringen in här.
                  ) {},
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
                'Pluggga',
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
        //
        //
        //
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 58.0,
          ),
          onPressed: (//funktionen för lägga till tasks här
              ) {},
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
