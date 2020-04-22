import "package:equatable/equatable.dart";

abstract class RouteEvent extends Equatable {
  const RouteEvent();

  @override
  List<Object> get props => [];
}

class MoveToRoot extends RouteEvent {
  @override
  String toString() => "/";
}

class MoveToHome extends RouteEvent {
  @override
  String toString() => "/home";
}
class MoveToLogin extends RouteEvent {
  @override
  String toString() => "/login";
}
class MoveToLogout extends RouteEvent {
  @override
  String toString() => "/logout";
}
class MoveToRegister extends RouteEvent {
  @override
  String toString() => "/register";
}

// Navigate Replace
class NavigateReplace extends RouteEvent {
  final String routeName;
  final Object arguments;
  final Object result;

  NavigateReplace(this.routeName, {this.arguments, this.result});

  @override
  List<Object> get props => [routeName, arguments, result];

  @override
  String toString() => """NavigateReplace{routeName: $routeName, $arguments}""";
}

// Navigate push
class NavigatePush extends RouteEvent {
  final String routeName;
  final Object arguments;
  final Object result;

  NavigatePush(this.routeName, {this.arguments, this.result});

  @override
  String toString() {
    return 'NavigatePush{routeName: $routeName, $arguments}';
  }
}

// Navigate pop
class NavigatePop extends RouteEvent {
  @override
  String toString() {
    return 'NavigatePopAction';
  }
}
