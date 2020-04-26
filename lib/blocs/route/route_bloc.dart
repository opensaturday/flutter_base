import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/repository/route/route_entity.dart';
import 'package:flutter_base/repository/route/route_model.dart';
import 'package:uuid/uuid.dart';

import 'route_event.dart';
import 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final RouteModel _routeRepository;

  RouteBloc({@required RouteModel routeRepository})
      : _routeRepository = routeRepository;

  @override
  RouteState get initialState => RouteState.empty();

  @override
  Stream<RouteState> mapEventToState(RouteEvent event) async* {
    if (event is NavigateReplace) {
      RouteEntity routeEntity = RouteEntity(
          uuid: Uuid().v4(),
          routeName: event.routeName,
          navigatorAction: "pushReplacementNamed",
          navigatorArguments: event.arguments,
          navigatorResult: event.result,
          createdAt: DateTime
              .now()
              .millisecondsSinceEpoch);
      await _routeRepository.pushRoute(routeEntity);
      yield RouteState(route: event.routeName);
    }

    if (event is NavigatePush) {
      RouteEntity routeEntity = RouteEntity(
          uuid: Uuid().v4(),
          routeName: event.routeName,
          navigatorAction: "pushNamed",
          navigatorArguments: event.arguments,
          navigatorResult: event.result,
          createdAt: DateTime
              .now()
              .millisecondsSinceEpoch);
      await _routeRepository.pushRoute(routeEntity);
      yield RouteState(route: event.routeName);
    }

    if (event is NavigatePop) {
      var routes = await _routeRepository.loadRoutes();
      if (routes.isNotEmpty) {
        routes.removeLast();
      }

      yield RouteState(route: routes.isEmpty ? "" : routes[0].routeName);
    }
  }
}