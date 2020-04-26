import 'route_entity.dart';

// Route Repository 는 사용자의 화면 이동 트래킹 및 디버깅으로 사용하기 위해 제작되었습니다.
abstract class RouteModel {

  Future<List<RouteEntity>> loadRoutes();

  Future pushRoute(RouteEntity routeEntity);
  
  Future replaceRoute(RouteEntity routeEntity);

  Future popRoute();
}
