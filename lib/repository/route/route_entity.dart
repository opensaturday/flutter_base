import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class RouteEntity extends Equatable {
  final String id;
  final String routeName;
  final String navigatorAction;
  final String navigatorArguments;
  final String navigatorResult;

  RouteEntity(
      {this.id,
      @required this.routeName,
      @required this.navigatorAction,
      this.navigatorArguments,
      this.navigatorResult})
      : assert(routeName != null),
        assert(navigatorAction != null);

  @override
  List<Object> get props =>
      [id, navigatorAction, routeName, navigatorArguments, navigatorResult];

  RouteEntity copyWith({int id}) {
    return RouteEntity(
        id: id ?? this.id,
        routeName: this.routeName,
        navigatorAction: this.navigatorAction,
        navigatorArguments: this.navigatorArguments,
        navigatorResult: this.navigatorResult);
  }

  Map<String, Object> toJson() {
    return {
      "id": id,
      "routeName": routeName,
      "navigatorAction": navigatorAction,
      "navigatorArguments": navigatorArguments,
      "navigatorResult": navigatorResult
    };
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "routeName": routeName,
      "navigatorAction": navigatorAction,
      "navigatorArguments": navigatorArguments,
      "navigatorResult": navigatorResult
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'RouteEntity{id: $id, routeName: $routeName, navigatorAction: $navigatorAction, navigatorArguments: $navigatorArguments, navigatorResult: $navigatorResult}';
  }

  static RouteEntity fromJson(Map<String, Object> json) {
    return RouteEntity(
      id: json["id"] as String,
      routeName: json["routeName"] as String,
      navigatorAction: json["navigatorAction"] as String,
      navigatorArguments: json["navigatorArguments"],
      navigatorResult: json["navigatorResult"],
    );
  }

  static RouteEntity fromMap(Map<String, dynamic> map) {
    return RouteEntity(
      id: map["id"],
      routeName: map["routeName"],
      navigatorAction: map["navigatorAction"],
      navigatorArguments: map["navigatorArguments"],
      navigatorResult: map["navigatorResult"],
    );
  }
}
