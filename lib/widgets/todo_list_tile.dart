import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onChange; //receives bool
  final Function onDismiss;

  TodoListTile({
    @required this.title,
    @required this.onChange,
    @required this.isChecked,
    @required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      onDismissed: (DismissDirection direction) {
        onDismiss();
      },
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        leading: CircleAvatar(
          child: Text(title != '' ? title[0] : ' '),
        ),
        trailing: Checkbox(value: isChecked, onChanged: onChange),
      ),
    );
  }
}
