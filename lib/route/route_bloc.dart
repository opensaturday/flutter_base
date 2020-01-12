import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lime_app/repository/route/route_entity.dart';
import 'package:lime_app/repository/route/route_model.dart';

import 'route_event.dart';
import 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final GlobalKey<NavigatorState> navigatorKey;

  final RouteModel routeRepository;

  RouteBloc({@required this.navigatorKey, @required this.routeRepository})
      : assert(navigatorKey != null),
        assert(routeRepository != null);

  @override
  RouteState get initialState => RouteState.empty();

  @override
  Stream<RouteState> mapEventToState(RouteEvent event) async* {
    if (event is NavigateReplace) {
      if (state.routes.length == 0) {
        navigatorKey.currentState
            .pushReplacementNamed(event.routeName, arguments: event.arguments);

        RouteEntity routeEntity = RouteEntity(
            routeName: event.routeName,
            navigatorAction: "pushReplacementNamed",
            navigatorArguments: event.arguments,
            navigatorResult: event.result);
        routeRepository.addRoute(routeEntity);

        yield RouteState(routes: [event.routeName]);
      } else if (state.routes.last != null &&
          state.routes.last != event.routeName) {
        navigatorKey.currentState
            .pushReplacementNamed(event.routeName, arguments: event.arguments);

        RouteEntity routeEntity = RouteEntity(
            routeName: event.routeName,
            navigatorAction: "pushReplacementNamed",
            navigatorArguments: event.arguments,
            navigatorResult: event.result);
        routeRepository.addRoute(routeEntity);

        yield RouteState(routes: [event.routeName]);
      }
    }

    if (event is NavigatePush) {
      if (state.routes.length == 0) {
        navigatorKey.currentState
            .pushNamed(event.routeName, arguments: event.arguments);

        RouteEntity routeEntity = RouteEntity(
            routeName: event.routeName,
            navigatorAction: "pushNamed",
            navigatorArguments: event.arguments,
            navigatorResult: event.result);
        routeRepository.addRoute(routeEntity);

        var result = List<String>.from(state.routes);
        result.add(event.routeName);
        yield RouteState(routes: result);
      } else if (state.routes.last != null &&
          state.routes.last != event.routeName) {
        navigatorKey.currentState
            .pushNamed(event.routeName, arguments: event.arguments);

        RouteEntity routeEntity = RouteEntity(
            routeName: event.routeName,
            navigatorAction: "pushNamed",
            navigatorArguments: event.arguments,
            navigatorResult: event.result);
        routeRepository.addRoute(routeEntity);

        var result = List<String>.from(state.routes);
        result.add(event.routeName);
        yield RouteState(routes: result);
      }
    }

    if (event is NavigatePop) {
      if (state.routes.last != null) {
        navigatorKey.currentState.pop();

        RouteEntity routeEntity = RouteEntity(
            routeName: "",
            navigatorAction: "NavigatePop",
            navigatorArguments: "",
            navigatorResult: "");
        routeRepository.addRoute(routeEntity);

        var result = List<String>.from(state.routes);
        if (result.isNotEmpty) {
          result.removeLast();
        }
        yield RouteState(routes: result);
      }
    }
  }
}
