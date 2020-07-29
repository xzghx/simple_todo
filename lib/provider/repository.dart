import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/provider/todo_provider.dart';

class Repository {
  TodoProvider todoProvider = TodoProvider(); //creates an instance of db provider and db
  Future<List<Todo>> getAll() async{
    return await todoProvider.getAll();
  }

  Future<int> addToDb(Todo todo) async {
    return await todoProvider.insert(todo);
  }

  Future<int> deleteFromDb(Todo todo) async {
    return await todoProvider.delete(todo);
  }

  Future<int> updateInDb(Todo todo) async {
    return await todoProvider.update(todo);
  }
}
