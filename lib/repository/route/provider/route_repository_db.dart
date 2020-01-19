import 'package:flutter_base/repository/common/provider/provider.dart';
import 'package:flutter_base/repository/route/route_entity.dart';
import 'package:flutter_base/repository/route/route_model.dart';
import 'package:sqflite/sqflite.dart';

class RouteRepositoryDb implements RouteModel {
  static final int version = 1;

  static final String tableName = "routes";

  static final String schema = '''
    CREATE TABLE $tableName (
      ${DatabaseConstants.COLUMN_ID} INTEGER PRIMARY KEY, 
      ${DatabaseConstants.COLUMN_UUID} TEXT, 
      ${DatabaseConstants.COLUMN_ROUTE_NAME} TEXT, 
      ${DatabaseConstants.COLUMN_NAVIGATOR_ACTION} TEXT, 
      ${DatabaseConstants.COLUMN_NAVIGATOR_ARGUMENTS} TEXT, 
      ${DatabaseConstants.COLUMN_NAVIGATOR_RESULT} TEXT, 
      ${DatabaseConstants.COLUMN_CREATED_AT} DATETIME DEFAULT CURRENT_TIMESTAM, 
      ${DatabaseConstants.COLUMN_UPDATED_AT} DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP, 
      ${DatabaseConstants.COLUMN_NOT_DELETED} NUMERIC DEFAULT 0, 
      ${DatabaseConstants.COLUMN_DELETED_AT} DATETIME)
  ''';

  Database _database;

  RouteRepositoryDb();

  Future open() async {
    if (_database != null) {
      return;
    }

    _database = await DatabaseProvider().database;
  }

  Future<RouteEntity> insert(RouteEntity routeEntity) async {
    int id = await _database.insert(tableName, routeEntity.toMap());
    return routeEntity.copyWith(uuid: routeEntity.uuid);
  }

  Future<RouteEntity> getTodo(int id) async {
    List<Map> maps = await _database.query(tableName,
        columns: [DatabaseConstants.COLUMN_ID],
        where: '${DatabaseConstants.COLUMN_ID} = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return RouteEntity.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await _database
        .delete(tableName, where: '${DatabaseConstants.COLUMN_ID} = ?', whereArgs: [id]);
  }

  Future<int> update(RouteEntity routeEntity) async {
    return await _database.update(tableName, routeEntity.toMap(),
        where: '${DatabaseConstants.COLUMN_ID} = ?', whereArgs: [routeEntity.uuid]);
  }

  Future close() async => _database.close();

  @override
  Future<List<RouteEntity>> loadRoutes() async {
    // TODO: implement loadRoutes
    throw UnimplementedError();
  }

  @override
  Future addRoute(RouteEntity route) async {
    // TODO: implement saveRoutes
    throw UnimplementedError();
  }
}
