import 'package:flutter/material.dart';

class ToDoModell {
  String titleToDo;
  bool isDone;

  ToDoModell({required this.titleToDo, this.isDone = false});
}

class ToDoListproviderState extends ChangeNotifier {
  final List<ToDoModell> _list = [];
  Object _filterBy = 'All';

  List<ToDoModell> get list => _list;

  Object get filterBy => _filterBy;

  void addToDo(ToDoModell toDo) {
    _list.add(toDo);
    notifyListeners();
  }

  void removeToDo(ToDoModell toDo) {
    _list.remove(toDo);
    notifyListeners();
  }

  void setFilterBy(Object filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }
}
