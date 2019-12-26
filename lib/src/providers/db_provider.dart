import 'package:sqflite/sqflite.dart';

class DBProvider {

  static Database _database;
  static final DBProvider dbProvider = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  initDB() async {

  }

}