import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lime_app/route/bloc.dart';
import 'package:mockito/mockito.dart';

class MockRouteBloc extends MockBloc<RouteEvent, RouteState> implements RouteBloc {}

void main() {
  group('RouterBloc', () {
    RouteBloc routerBloc;

    setUp() {
      routerBloc = RouteBloc();
    }
  });
}