import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? _database;

class LocalDatabase {
  Future get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase('Local.db');
    return _database;
  }

  Future _initDatabase(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY,
        title TEXT,
        is_done BOOLEAN default false,
      )
    ''');
  }

  Future addDataLocally({Name}) async {
    final db = await database;
    await db.insert('todo', {'title': Name});
    return 'added';
  }
}
