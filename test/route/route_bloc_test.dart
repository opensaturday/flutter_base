import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_base/route/authentication.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRouteRepository extends Mock implements RouteRepository {}

void main() {
  RouteRepository routeRepository;
  GlobalKey<NavigatorState> mockNavigatorKey;
  RouteBloc bloc;

  setUp() {
    mockNavigatorKey = GlobalKey();
    routeRepository = MockRouteRepository();
    bloc = RouteBloc(
      navigatorKey: mockNavigatorKey,
      routeRepository: routeRepository,
    );
  }

  group("whenListen", () {
    setUp();

    test("Let's mock the RouteBloc's stream!", () {
      whenListen(bloc, Stream.fromIterable([NavigatePop()]));
      expectLater(bloc, emitsInOrder([RouteState(routes: [])]));
    });
  });

  group('emitsExactly', () {
    setUp();

    test('emits [0] when nothing is added', () async {
      await emitsExactly(bloc, [RouteState(routes: [])]);
    });

    test('emits [0, 1] when CounterEvent.increment is added', () async {
      bloc.add(NavigatePop());
      await emitsExactly(bloc, [RouteState(routes: [])]);
    });
  });

  group('blocTest', () {
    setUp();

    blocTest(
      'emits [0] when nothing is added',
      build: () => bloc,
      expect: [RouteState(routes: [])],
    );

    blocTest(
      'emits [NavigatePush, NavigatePop] when successful',
      build: () => bloc,
      act: (bloc) => bloc.add(NavigatePush("/")),
      expect: [
        RouteState(routes: ["/"])
      ],
    );
  });
}
