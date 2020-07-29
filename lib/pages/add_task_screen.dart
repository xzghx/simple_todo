import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../provider/todo_model.dart';
class AddTaskScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() =>AddTaskScreenState();

}

class AddTaskScreenState extends State<AddTaskScreen> {
  final _controllerAddTodo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'اضافه کردن مورد جدید',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Theme.of(context).primaryColor),
                ),
                TextField(
                  controller: _controllerAddTodo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  child: Text('اضافه شود'),
                  onPressed: ()async {
                    print('button press : ');
                    Todo todo = new Todo(title: _controllerAddTodo.text, isDone: false);
                   int res=await Provider.of<TodoModel>(context,listen: false).addTask(todo);
                   print('$res');
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
