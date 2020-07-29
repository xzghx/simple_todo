import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'provider/todo_model.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoModel>(
      create: (BuildContext context) => TodoModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'لیست من',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  Route onGenerateRoute(RouteSettings settings) {
    //best place for data initializations is in builders
    String routeName = settings.name;
    if (routeName == '/') {
      return MaterialPageRoute(builder: (context) {
        final TodoModel todoModel = Provider.of<TodoModel>(context,listen: false);
        todoModel.fetchFromDb();
        return HomePage();
      });
    }
  }
}
