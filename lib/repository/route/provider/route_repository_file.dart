import 'dart:async';
import 'dart:convert';

import 'package:lime_app/repository/common/provider/provider.dart';
import 'package:lime_app/repository/route/route_entity.dart';
import 'package:lime_app/repository/route/route_model.dart';

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
    final json = JsonDecoder().convert(fileData);
    final routes = (json['routes'])
        .map<RouteEntity>((routes) => RouteEntity.fromJson(routes))
        .toList();
    return routes;
  }

  @override
  Future addRoute(RouteEntity route) async {
    final localFile = await _fileStorageProvider.getLocalFile(tag: _TAG);

    return localFile.writeAsString(JsonEncoder().convert({
      'routes': route.toJson()
    }));
  }
}
