import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'todo_model.dart';

void main() {
  var state = ToDoproviderState();
  state.getList();

  runApp(
      ChangeNotifierProvider(create: (context) => state, child: const MyApp()));
  //initierar providern
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODOLIST',
        theme: ThemeData(
            textTheme:
                GoogleFonts.recursiveTextTheme(Theme.of(context).textTheme)),
        //ändrar fonttemat för hela appen
        home: const HomePage());
  }
}
