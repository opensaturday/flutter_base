import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticationState {
  final String displayName;

  Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class Unauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class FireAuthenticationLoading extends AuthenticationState {}
