import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_first_app/todo_model.dart';

const key = '2fd670ae-d7b5-4ebe-8b3b-4bc513fe2de9';
const url = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<ToDoModell>> add(ToDoModell toDo) async {
    Map<String, dynamic> json = ToDoModell.toJson(toDo);
    var bodyString = jsonEncode(json);
    var response = await http.post(Uri.parse('$url/todos?key=$key'),
        body: bodyString, headers: {'Content-Type': 'application/json'});
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ToDoModell>((data) {
      return ToDoModell.fromJson(data);
    }).toList();
  }

  static Future remove(String id) async {
    var response =
        await http.delete(Uri.parse('$url/todos/$id?key=$key&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ToDoModell>((data) {
      return ToDoModell.fromJson(data);
    }).toList();
  }

  static Future getTodos() async {
    var response = await http.get(Uri.parse('$url/todos?key=$key'));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<ToDoModell>((data) {
      return ToDoModell.fromJson(data);
    }).toList();
  }

  static Future updateTodo(ToDoModell toDo, value) async {
    String toDoid = toDo.id;
    toDo.done = value;
    Map<String, dynamic> json = ToDoModell.toJson(toDo);
    var bodyString = jsonEncode(json);
    await http.put(
      Uri.parse('$url/todos/$toDoid?key=$key'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
