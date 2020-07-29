import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/provider/repository.dart';

class TodoModel extends ChangeNotifier {
  final List<Todo> _todoList = [];
  final Repository _repository = Repository();

  UnmodifiableListView<Todo> get allTodos {
    return UnmodifiableListView(_todoList);
  }

  int get length => _todoList.length;

  Future<void> fetchFromDb() async {
   List<Todo> lst= await _repository.getAll();
    _todoList.addAll(lst);

    notifyListeners();
//    return UnmodifiableListView(_todoList);
  }

  Future<int> addTask(Todo todo) async {
    _todoList.add(todo);
   int res=  await _repository.addToDb(todo);
    notifyListeners();
    return res;
  }

  void deleteTask(Todo todo) async {
    _todoList.remove(todo);
    await _repository.deleteFromDb(todo);
    notifyListeners();
  }

  void updateTask(Todo todo) async {
    todo.toggleDone();
    await _repository.updateInDb(todo);
    notifyListeners();
  }

}
