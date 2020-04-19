import 'dart:async';

import 'package:csv/csv.dart';
import 'package:flutter_base/repository/common/provider/provider.dart';
import 'package:flutter_base/repository/route/route_entity.dart';
import 'package:flutter_base/repository/route/route_model.dart';

class RouteRepositoryFile implements RouteModel {
  final String _TAG = "routes";

  FileStorageProvider _fileStorageProvider;

  RouteRepositoryFile() {
    _fileStorageProvider = FileStorageProvider();
  }

  @override
  Future<List<RouteEntity>> loadRoutes() async {
    final localFile = await _fileStorageProvider.getLocalFile(tag: _TAG);
    final fileData = await localFile.readAsString();

    List<List<dynamic>> rowsAsListOfValues =
        CsvToListConverter().convert(fileData);

    List<RouteEntity> routeEntities = List();
    rowsAsListOfValues.forEach((row) {
      var routeEntity = RouteEntity(
        uuid: row[0],
        routeName: row[1],
        navigatorAction: row[2],
        navigatorArguments: row[3],
        navigatorResult: row[4],
        createdAt: row[5],
      );
      routeEntities.add(routeEntity);
    });

    return routeEntities;
  }

  @override
  Future addRoute(RouteEntity route) async {
    final localFile = await _fileStorageProvider.getLocalFile(tag: _TAG);
    final routeCsvRow = ListToCsvConverter().convert([route.props]);
    await localFile.writeAsString(routeCsvRow);
  }
}
