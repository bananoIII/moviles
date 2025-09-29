import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:progra_movil/models/movies.dart';
import 'package:sqflite/sqflite.dart';

class MoviesDatabase {
  static final nameDB = "movies_db";
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
      create table tbl_movies(
        id_movie integer ,
        name varchar (50),
        duration char(3) ,
        date_release char(10),
        image varchar(15),
        constraint pk_tbl_movies primary key(id_movie)
      );
    ''';
    db.execute(query);
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    var con = await database;
    return con!.insert(table, data);
  }

  Future<List<Movies>> select(String table) async {
    var con = await database;
    final res = await con!.query(table);
    return res.map((movie) => Movies.fromMap(movie)).toList();
  }

  Future<int> update(String table, Map<String, dynamic> data) async {
    var con = await database;
    return con!.update(
      table,
      data,
      where: 'id_movie = ?',
      whereArgs: [data['id_movie']],
    );
  }

  Future<int> delete(String table, int id) async {
    var con = await database;
    return con!.delete(table, where: 'id_movie = ?', whereArgs: [id]);
  }
}
