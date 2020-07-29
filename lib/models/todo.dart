class Todo {
  String title;
  bool isDone;

  Todo({this.title, this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone ? 1 : 0,
    };
  }

  Todo.fromJson(Map<String, dynamic> decoded) {
    title = decoded['title'];
    isDone = decoded['isDone'] == 1 ? true : false;
  }
}
