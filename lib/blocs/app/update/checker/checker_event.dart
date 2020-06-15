import 'package:equatable/equatable.dart';

abstract class CheckerEvent extends Equatable {
  const CheckerEvent();

  @override
  List<Object> get props => [];
}

class AppUpdateCheck extends CheckerEvent {}