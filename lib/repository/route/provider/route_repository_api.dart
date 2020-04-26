import 'package:flutter_base/repository/route/route_entity.dart';
import 'package:flutter_base/repository/route/route_model.dart';

class RouteRepositoryApi implements RouteModel {
  @override
  Future<List<RouteEntity>> loadRoutes() {
    // TODO: implement loadRoutes
    throw UnimplementedError();
  }

  @override
  Future pushRoute(RouteEntity route) {
    // TODO: implement saveRoutes
    throw UnimplementedError();
  }

  @override
  Future popRoute() {
    // TODO: implement popRoute
    return null;
  }

  @override
  Future replaceRoute(RouteEntity routeEntity) {
    // TODO: implement replaceRoute
    return null;
  }
}
