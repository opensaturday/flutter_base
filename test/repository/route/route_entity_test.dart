import 'package:flutter_base/repository/route/route_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Obect create succesful.', () {
    RouteEntity routeEntity = RouteEntity(
      uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
      routeName: "/pageA",
      navigatorAction: "pushReplacementNamed",
      navigatorArguments: "",
      navigatorResult: "",
      createdAt: 1579404240939,
    );
    expect(routeEntity != null, true);
  });

  group("Constructor assertion test", () {
    test("1. 'id' must fill!", () {
      expect(
          () => RouteEntity(
                routeName: "/pageA",
                navigatorAction: "pushReplacementNamed",
                navigatorArguments: "",
                navigatorResult: "",
                createdAt: 1579404240939,
              ),
          throwsA(const TypeMatcher<AssertionError>()));
    });

    test("2. 'routeName' must fill!", () {
      expect(
          () => RouteEntity(
                uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
                navigatorAction: "pushReplacementNamed",
                navigatorArguments: "",
                navigatorResult: "",
                createdAt: 1579404240939,
              ),
          throwsA(const TypeMatcher<AssertionError>()));
    });

    test("3. 'navigatorAction' must fill!", () {
      expect(
          () => RouteEntity(
                uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
                routeName: "/pageA",
                navigatorArguments: "",
                navigatorResult: "",
                createdAt: 1579404240939,
              ),
          throwsA(const TypeMatcher<AssertionError>()));
    });

    test("3. 'createdAt' must fill!", () {
      expect(
          () => RouteEntity(
                uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
                routeName: "/pageA",
                navigatorAction: "pushReplacementNamed",
                navigatorArguments: "",
                navigatorResult: "",
              ),
          throwsA(const TypeMatcher<AssertionError>()));
    });
  });

  test("Variable convert to Serialization.", () {
    RouteEntity routeEntity = RouteEntity(
      uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
      routeName: "/pageA",
      navigatorAction: "pushReplacementNamed",
      navigatorArguments: "",
      navigatorResult: "",
      createdAt: 1579404240939,
    );

    List<Object> routeEntityProps = routeEntity.props;

    expect(routeEntityProps.length, 6);

    expect(routeEntityProps[0], "60ff264c-9690-4610-a213-ccaeca69e6c0");
    expect(routeEntityProps[1], "/pageA");
    expect(routeEntityProps[2], "pushReplacementNamed");
    expect(routeEntityProps[3], '');
    expect(routeEntityProps[4], '');
    expect(routeEntityProps[5], 1579404240939);
  });

  group("Copy object", () {
    test('Original object copy.', () {
      RouteEntity routeEntity = RouteEntity(
        uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
        routeName: "/pageA",
        navigatorAction: "pushReplacementNamed",
        navigatorArguments: null,
        navigatorResult: null,
        createdAt: 1579404240939,
      );

      RouteEntity routeEntityCopied = routeEntity.copyWith();

      expect(routeEntityCopied.uuid, "60ff264c-9690-4610-a213-ccaeca69e6c0");
      expect(routeEntityCopied.routeName, "/pageA");
      expect(routeEntityCopied.navigatorAction, "pushReplacementNamed");
      expect(routeEntityCopied.navigatorArguments, null);
      expect(routeEntityCopied.navigatorResult, null);
      expect(routeEntityCopied.createdAt, 1579404240939);
    });

    test('Object copy and set new id', () {
      RouteEntity routeEntity = RouteEntity(
        uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
        routeName: "/pageA",
        navigatorAction: "pushReplacementNamed",
        navigatorArguments: null,
        navigatorResult: null,
        createdAt: 1579404240939,
      );

      RouteEntity routeEntityCopied =
          routeEntity.copyWith(uuid: "80ff264c-9690-4610-a213-ccaeca69e3c1");

      expect(routeEntityCopied.uuid, "80ff264c-9690-4610-a213-ccaeca69e3c1");
      expect(routeEntityCopied.routeName, "/pageA");
      expect(routeEntityCopied.navigatorAction, "pushReplacementNamed");
      expect(routeEntityCopied.navigatorArguments, null);
      expect(routeEntityCopied.navigatorResult, null);
      expect(routeEntityCopied.createdAt, 1579404240939);
    });
  });

  test('객체를 JSON 형태로 변환합니다.', () {
    RouteEntity routeEntity = RouteEntity(
      uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
      routeName: "/pageA",
      navigatorAction: "pushReplacementNamed",
      navigatorArguments: null,
      navigatorResult: null,
      createdAt: 1579404240939,
    );

    final Map<String, dynamic> routeJson = routeEntity.toJson();

    expect(routeJson["id"], "60ff264c-9690-4610-a213-ccaeca69e6c0");
    expect(routeJson["routeName"], "/pageA");
    expect(routeJson["navigatorAction"], "pushReplacementNamed");
    expect(routeJson["navigatorArguments"], null);
    expect(routeJson["navigatorResult"], null);
    expect(routeJson["createdAt"], 1579404240939);
  });

  test('JSON을 객체로 변환합니다.', () {
    var routeEntityJson = {
      "id": "60ff264c-9690-4610-a213-ccaeca69e6c0",
      "routeName": "/pageA",
      "navigatorAction": "pushReplacementNamed",
      "navigatorArguments": null,
      "navigatorResult": null,
      "createdAt": 1579404240939,
    };

    RouteEntity routeEntity = RouteEntity.fromJson(routeEntityJson);
    expect(routeEntity.uuid, "60ff264c-9690-4610-a213-ccaeca69e6c0");
    expect(routeEntity.routeName, "/pageA");
    expect(routeEntity.navigatorAction, "pushReplacementNamed");
    expect(routeEntity.navigatorArguments, null);
    expect(routeEntity.navigatorResult, null);
    expect(routeEntity.createdAt, 1579404240939);
  });

  test('객체를 Map 형태로 변환합니다.', () {
    RouteEntity routeEntity = RouteEntity(
      uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
      routeName: "/pageA",
      navigatorAction: "pushReplacementNamed",
      navigatorArguments: null,
      navigatorResult: null,
      createdAt: 1579404240939,
    );

    final Map<String, dynamic> routeMap = routeEntity.toMap();

    expect(routeMap["id"], "60ff264c-9690-4610-a213-ccaeca69e6c0");
    expect(routeMap["routeName"], "/pageA");
    expect(routeMap["navigatorAction"], "pushReplacementNamed");
    expect(routeMap["navigatorArguments"], null);
    expect(routeMap["navigatorResult"], null);
    expect(routeMap["createdAt"], 1579404240939);
  });

  test('Map을 객체로 변환합니다.', () {
    Map<String, dynamic> routeEntityMap = {
      "id": "60ff264c-9690-4610-a213-ccaeca69e6c0",
      "routeName": "/pageA",
      "navigatorAction": "pushReplacementNamed",
      "navigatorArguments": null,
      "navigatorResult": null,
      "createdAt": 1579404240939,
    };

    RouteEntity routeEntity = RouteEntity.fromMap(routeEntityMap);
    expect(routeEntity.uuid, "60ff264c-9690-4610-a213-ccaeca69e6c0");
    expect(routeEntity.routeName, "/pageA");
    expect(routeEntity.navigatorAction, "pushReplacementNamed");
    expect(routeEntity.navigatorArguments, null);
    expect(routeEntity.navigatorResult, null);
    expect(routeEntity.createdAt, 1579404240939);
  });

  test('toString() 함수가 의도된 대로 출력됩니다. ', () {
    RouteEntity routeEntity = RouteEntity(
      uuid: "60ff264c-9690-4610-a213-ccaeca69e6c0",
      routeName: "/pageA",
      navigatorAction: "pushReplacementNamed",
      navigatorArguments: null,
      navigatorResult: null,
      createdAt: 1579404240939,
    );

    expect(
        routeEntity.toString() ==
            "RouteEntity{id: 60ff264c-9690-4610-a213-ccaeca69e6c0, routeName: /pageA, navigatorAction: pushReplacementNamed, navigatorArguments: null, navigatorResult: null, createdAt: 1579404240939}",
        true);
  });
}
