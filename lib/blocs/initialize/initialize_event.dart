import 'package:equatable/equatable.dart';

abstract class InitializeEvent extends Equatable {
  const InitializeEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends InitializeEvent {}

class Uninitialized extends InitializeEvent {}