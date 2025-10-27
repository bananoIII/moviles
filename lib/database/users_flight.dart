import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:progra_movil/models/movies.dart';
import 'package:progra_movil/models/users_model.dart';
import 'package:sqflite/sqflite.dart';

class UsersFlightDatabase {
  static final nameDB = "flights_db";
  static final versionDB = 1;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    return _database = await _initDatabase();
  }

  Future<Database?> _initDatabase() async {
    Directory folder = await getApplicationCacheDirectory();
    String pathDB =
        "${folder}/${nameDB}"; // join(folder.path, '/', nameDB); // + nameDB;
    return openDatabase(pathDB, version: versionDB, onCreate: createTables);
  }

  createTables(Database db, int version) {
    String query = '''
      create table tbl_users (
        id_user integer primary key autoincrement,
        name varchar(50) not null,
        birth_date char(10) not null,
        image varchar(100),
        type varchar(20),
        state varchar(20)
      );
    ''';
    db.execute(query);
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    var con = await database;
    return con!.insert(table, data);
  }

  Future<List<UsersModel>> select(String table, String type) async {
    var con = await database;
    final res = await con!.query(table, where: 'type = ?', whereArgs: [type]);
    return res.map((users) => UsersModel.fromMap(users)).toList();
  }

  Future<int> update(String table, Map<String, dynamic> data) async {
    var con = await database;
    return con!.update(
      table,
      data,
      where: 'id_user = ?',
      whereArgs: [data['id_user']],
    );
  }

  Future<int> delete(String table, int id) async {
    var con = await database;
    return con!.delete(table, where: 'id_user = ?', whereArgs: [id]);
  }
}
