import 'package:flutter_base/repository/route/provider/route_repository_db.dart';
import 'package:flutter_base/repository/route/provider/route_repository_file.dart';
import 'package:flutter_base/repository/route/route_entity.dart';
import 'package:flutter_base/repository/route/route_model.dart';

class RouteRepository implements RouteModel {
  final RouteRepositoryFile _routeRepositoryFile = RouteRepositoryFile();
  final RouteRepositoryDb _routeRepositoryDb = RouteRepositoryDb();
  final List<RouteEntity> _routes = List();

  RouteRepository();

  @override
  Future<List<RouteEntity>> loadRoutes() async {
    print("loadRoutes::$_routes");
    return _routes;
//    return _routeRepositoryFile.loadRoutes();
  }

  @override
  Future pushRoute(RouteEntity routeEntity) async {
    _routes.add(routeEntity);
    print("pushRoute::$_routes");
    return _routes;
//    return _routeRepositoryFile.pushRoute(route);
  }

  @override
  Future popRoute() async {
    _routes.removeLast();
    print("popRoute::$_routes");
    return _routes;
  }

  @override
  Future replaceRoute(RouteEntity routeEntity) async {
    _routes.removeLast();
    _routes.add(routeEntity);
    print("replaceRoute::$_routes");
    return _routes;
  }
}
