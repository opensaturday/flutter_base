import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class RouteState extends Equatable {
  final String route;

  RouteState({@required this.route});

  @override
  List<Object> get props => [route];

  factory RouteState.empty() {
    return RouteState(route: "/");
  }

  RouteState copyWith({
    String route,
  }) {
    return RouteState(
      route: route ?? this.route,
    );
  }

  @override
  String toString() {
    return '''RouteState { route: $route, }''';
  }
}
