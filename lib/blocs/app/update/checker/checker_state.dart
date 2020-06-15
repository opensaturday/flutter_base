import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class CheckerState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateCheckFailed extends CheckerState {}

class UpdateAreAvailable extends CheckerState {}

class NoMoreUpdates extends CheckerState {
  final int checkedAt;

  NoMoreUpdates({this.checkedAt});

  @override
  List<Object> get props => [checkedAt];

  @override
  String toString() => 'NoMoreUpdates { checkedAt: $checkedAt}';
}
