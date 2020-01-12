import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class RouteState extends Equatable {
  final List<String> routes;

  RouteState({@required this.routes});

  @override
  List<Object> get props => [routes];

  factory RouteState.empty() {
    return RouteState(
        routes: []
    );
  }

  RouteState copyWith({
    List<String> routes,
  }) {
    return RouteState(
      routes: routes ?? this.routes,
    );
  }

  @override
  String toString() {
    return '''RouteState {
      routes: $routes,
    }''';
  }
}
