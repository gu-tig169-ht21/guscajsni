import 'package:flutter/material.dart';
import 'package:my_first_app/todo_model.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ToDoListproviderState(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODOLIST',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const HomePage());
  }
}
