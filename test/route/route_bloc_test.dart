import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRouteRepository extends Mock implements RouteRepository {}

void main() {
  RouteRepository routeRepository;
  RouteBloc bloc;

  setUp() {
    routeRepository = MockRouteRepository();
    bloc = RouteBloc(
      routeRepository: routeRepository,
    );
  }

//  group("whenListen", () {
//    setUp();
//
//    test("Let's mock the RouteBloc's stream!", () {
//      whenListen(bloc, Stream.fromIterable([NavigatePop()]));
//      expectLater(bloc, emitsInOrder([RouteState(routes: [])]));
//    });
//  });
//
//  group('emitsExactly', () {
//    setUp();
//
//    test('emits [0] when nothing is added', () async {
//      await emitsExactly(bloc, [RouteState(routes: [])]);
//    });
//
//    test('emits [0, 1] when CounterEvent.increment is added', () async {
//      bloc.add(NavigatePop());
//      await emitsExactly(bloc, [RouteState(routes: [])]);
//    });
//  });

  group('blocTest', () {
    setUp();

    blocTest(
      'emits [] when nothing is added',
      build: () => bloc,
      expect: [RouteState(route: "/")],
    );

    blocTest(
      'emits [NavigatePush] when successful',
      build: () => bloc,
      act: (bloc) => bloc.add(NavigatePush("/home")),
      expect: [
        RouteState(route: "/"),
        RouteState(route: "/home"),
      ],
    );
  });
}
