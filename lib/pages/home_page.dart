import 'package:flutter/material.dart';
import 'package:my_todo_app/models/todo.dart';
import 'package:my_todo_app/provider/todo_model.dart';
import 'package:provider/provider.dart';

import '../widgets/todo_list_tile.dart';
import 'add_task_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
          }),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 60),
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      showAboutDialog(context: context,applicationName: 'نویسنده: زهرا غفوری',);
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30,
                      ),
                      radius: 30,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'لیست من',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  Text(
                    Provider.of<TodoModel>(context).length.toString(),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Expanded(child: _buildBottom(screen, context)),
          ],
        ),
      ),
    );
  }

  _buildBottom(Size screen, BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: (screen.height / 100) * 70,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(50))),
      child: Consumer<TodoModel>(
        builder: (context, TodoModel model, Widget child) {
          return ListView.builder(
              itemCount: model.length,
              itemBuilder: (context, index) {
                final Todo currentTodo = model.allTodos[index];
                return TodoListTile(
                  title: currentTodo.title,
                  isChecked: currentTodo.isDone,
                  onChange: (bool value) {
                    model.updateTask(currentTodo);
                  },
                  onDismiss: () {
                    model.deleteTask(currentTodo);

                  },
                );
              });
        },
      ),
    );
  }
}
