import 'package:flutter/material.dart';
import 'package:my_first_app/api.dart';

class ToDoModell {
  //modellen för varje todo
  String title;
  bool done;
  String id;

  ToDoModell({required this.title, this.done = false, this.id = ''});

  static Map<String, dynamic> toJson(ToDoModell toDo) {
    return {'title': toDo.title, 'done': toDo.done, 'id': toDo.id};
  }

  static ToDoModell fromJson(Map<String, dynamic> json) {
    return ToDoModell(title: json['title'], done: json['done'], id: json['id']);
  }
}

class ToDoproviderState extends ChangeNotifier {
  //providern för todolistan
  late List<ToDoModell> _list = [];
  Object _filterBy = 'All';

  List<ToDoModell> get list => _list;
  Object get filterBy => _filterBy;

  Future getList() async {
    List<ToDoModell> list = await Api.getTodos();
    _list = list;
    notifyListeners();
  }

  void addToDo(ToDoModell toDo) async {
    _list = await Api.add(toDo);
    notifyListeners();
  }

  void removeToDo(ToDoModell toDo) async {
    _list = await Api.remove(toDo.id);
    notifyListeners();
  }

  void isDone(ToDoModell toDo, value) async {
    toDo.done = !toDo.done;
    await Api.updateTodo(toDo, value);
    notifyListeners();
  }

  void setFilterBy(Object filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }
}
