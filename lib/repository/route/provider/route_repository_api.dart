import 'package:flutter_base/repository/route/provider/provider.dart';
import 'package:flutter_base/repository/route/route_entity.dart';

class RouteRepositoryApi implements RouteProvider {
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
