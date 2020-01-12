import 'package:lime_app/repository/route/provider/route_repository_db.dart';
import 'package:lime_app/repository/route/provider/route_repository_file.dart';
import 'package:lime_app/repository/route/route_entity.dart';
import 'package:lime_app/repository/route/route_model.dart';

class RouteRepository implements RouteModel {

  final RouteRepositoryFile _routeRepositoryFile = RouteRepositoryFile();
  final RouteRepositoryDb _routeRepositoryDb = RouteRepositoryDb();

  @override
  Future<List<RouteEntity>> loadRoutes() {
    return _routeRepositoryFile.loadRoutes();
  }

  @override
  Future addRoute(RouteEntity route) {
    _routeRepositoryFile.addRoute(route);
  }
}