import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

    List<RouteEntity> routeEntities = List();
    List<List<dynamic>> rowsAsListOfValues =
        CsvToListConverter().convert(fileData);
    for (List<dynamic> rows in rowsAsListOfValues) {
      routeEntities.add(RouteEntity(
        uuid: rows[0],
        routeName: rows[1],
        navigatorAction: rows[2],
        navigatorArguments: rows[3],
        navigatorResult: rows[4],
        createdAt: rows[5],
      ));
    }

    final JsonDecoder jsonDecoder = JsonDecoder();
    final json = jsonDecoder.convert(fileData);
    final routes = (json['routes'])
        .map<RouteEntity>((routes) => RouteEntity.fromJson(routes))
        .toList();
    return routes;
  }

  @override
  Future addRoute(RouteEntity route) async {
    final localFile = await _fileStorageProvider.getLocalFile(tag: _TAG);

    final routeCsvRow =
        ListToCsvConverter(fieldDelimiter: ',').convert([route.props]);
    return localFile.writeAsString(
      routeCsvRow,
      mode: FileMode.append,
      flush: true,
    );
  }
}
