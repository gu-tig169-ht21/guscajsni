import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'todo_model.dart';

void main() {
  var state = ToDoproviderState();
  state.getList();

  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'TODOLIST', home: HomePage());
  }
}
