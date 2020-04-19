import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_base/repository/route/route_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockRouteRepository extends Mock implements RouteRepository {}

// ignore: must_be_immutable
class MockRouteEntity extends Mock implements RouteEntity {}

void main() {
  RouteRepository routeRepository;

  setUp(() {
    routeRepository = MockRouteRepository();
  });

  group("LoadRoutes", () {
    test("Let's Mock Routes Load", () {
      List<RouteEntity> routeEntities = List();
      when(routeRepository.loadRoutes())
          .thenAnswer((_) => Future.value(routeEntities));
      expect(0, routeEntities.length);
    });
  });
}
