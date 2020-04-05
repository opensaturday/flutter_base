import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  String _tag;

  Database _database;

  // Create a singleton
  DatabaseProvider._internal();

  static final DatabaseProvider _databaseProvider =
      DatabaseProvider._internal();

  factory DatabaseProvider({String tag}) {
    // Tag set up in Dev, Stage, Prod
    if (tag == null) {
      tag = "default";
    }
    _databaseProvider._tag = tag;
    return _databaseProvider;
  }

  /// Implement Function
  Future<Database> get database async {
    if (_database != null && _database.isOpen) {
      return _database;
    }

    _database = await _initDB();
    return _database;
  }

  Future<String> _getDatabasePath() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    return join(documentsDir.path, 'LimeAppDatabase__$_tag.db');
  }

  _initDB() async {
    // Get the location of our app directory. This is where files for our app,
    // and only our app, are stored. Files in this directory are deleted
    // when the app is deleted.
    String path = await _getDatabasePath();

    return await openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (Database database, int version) async {
      // When creating the db, create the table
      _migrationToVersion(database, version);
    });
  }

  void _migrationToVersion(Database database, int version) async {
    if (version == 1) {
      await database.execute('''
          CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL
          ''');
      version++;
    }
  }

  void _deleteDatabase() async {
    String path = await _getDatabasePath();
    await deleteDatabase(path);
  }
}
