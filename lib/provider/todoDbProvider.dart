import 'dart:async';

import 'package:path/path.dart';
import 'package:rxdart/subjects.dart';
import 'package:sqflite/sqflite.dart';

class TodoDbProvider {
  Database db;
  String _dbPath;
  String tblTodo = 'tblTodo';

  TodoDbProvider(){
    open();
  }

  ///init database
  ///opens or creates if not exists
  Future open() async {
    String path = await getDatabasesPath();
    _dbPath = join(path, "todoDb.db");

    db = await openDatabase(_dbPath, version: 1, onCreate: onCreateDatabase);
  }

  Future<void> onCreateDatabase(Database db, int version) async {
    //Create Table todoo
    await db.execute('''
      CREATE TABLE $tblTodo (
        id integer PRIMARY KEY AUTOINCREMENT,
        title text,
        isDone integer
        )
      ''');
  }

  void close() async => await db.close();
}

TodoDbProvider todoDbProvider ;
