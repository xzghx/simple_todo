import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/provider/todoDbProvider.dart';

class TodoProvider extends TodoDbProvider {
//  TodoProvider() {
//    TodoDbProvider(); //opens or creates db has await inside
//  }

  Future<List<Todo>> getAll() async {
     todoDbProvider=TodoDbProvider();
 await todoDbProvider.open();
    List<Map<String, dynamic>> maps = await db.query(tblTodo);
    List<Todo> todos = [];
    if (maps.length > 0)
      maps.forEach(
        (Map<String, dynamic> map) {
          todos.add(Todo.fromJson(map));
        },
      );
    return todos;
  }

  Future<int> insert(Todo todo) async {
    return await db.insert(tblTodo, {'title': todo.title, 'isDone': todo.isDone ? 1 : 0});
  }

  Future<int> delete(Todo todo) async {
    return await db.delete(tblTodo, where: 'title =?', whereArgs: [todo.title]);
  }

  Future<int> update(Todo todo) async {
    return await db.update(tblTodo, {'isDone': todo.isDone ? 1 : 0, 'title': todo.title},
        where: 'title =?', whereArgs: [todo.title]);
  }
}
