import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class RouteEntity extends Equatable {
  final String uuid;
  final String routeName;
  final String navigatorAction;
  final String navigatorArguments;
  final String navigatorResult;
  final int createdAt;

  RouteEntity({
    @required this.uuid,
    @required this.routeName,
    @required this.navigatorAction,
    this.navigatorArguments,
    this.navigatorResult,
    @required this.createdAt,
  })  : assert(uuid != null),
        assert(routeName != null),
        assert(navigatorAction != null),
        assert(createdAt != null);

  @override
  List<Object> get props => [
        uuid,
        navigatorAction,
        routeName,
        navigatorArguments,
        navigatorResult,
        createdAt,
      ];

  RouteEntity copyWith({String uuid}) {
    return RouteEntity(
      uuid: uuid ?? this.uuid,
      routeName: this.routeName,
      navigatorAction: this.navigatorAction,
      navigatorArguments: this.navigatorArguments,
      navigatorResult: this.navigatorResult,
      createdAt: this.createdAt,
    );
  }

  Map<String, Object> toJson() {
    return {
      "id": uuid,
      "routeName": routeName,
      "navigatorAction": navigatorAction,
      "navigatorArguments": navigatorArguments,
      "navigatorResult": navigatorResult,
      "createdAt": createdAt,
    };
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "routeName": routeName,
      "navigatorAction": navigatorAction,
      "navigatorArguments": navigatorArguments,
      "navigatorResult": navigatorResult,
      "createdAt": createdAt,
    };
    if (uuid != null) {
      map["id"] = uuid;
    }
    return map;
  }

  @override
  String toString() {
    return 'RouteEntity{id: $uuid, routeName: $routeName, navigatorAction: $navigatorAction, navigatorArguments: $navigatorArguments, navigatorResult: $navigatorResult, createdAt: $createdAt}';
  }

  static RouteEntity fromJson(Map<String, Object> json) {
    return RouteEntity(
      uuid: json["id"] as String,
      routeName: json["routeName"] as String,
      navigatorAction: json["navigatorAction"] as String,
      navigatorArguments: json["navigatorArguments"],
      navigatorResult: json["navigatorResult"],
      createdAt: json["createdAt"],
    );
  }

  static RouteEntity fromMap(Map<String, dynamic> map) {
    return RouteEntity(
      uuid: map["id"],
      routeName: map["routeName"],
      navigatorAction: map["navigatorAction"],
      navigatorArguments: map["navigatorArguments"],
      navigatorResult: map["navigatorResult"],
      createdAt: map["createdAt"],
    );
  }
}
