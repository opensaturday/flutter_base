import 'package:meta/meta.dart';

@immutable
class LogoutState {
  final bool isSuccess;
  final bool isFailure;

  LogoutState({
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory LogoutState.empty() {
    return LogoutState(
      isSuccess: false,
      isFailure: false,
    );
  }

  factory LogoutState.success() {
    return LogoutState(
      isSuccess: true,
      isFailure: false,
    );
  }

  factory LogoutState.failure() {
    return LogoutState(
      isSuccess: false,
      isFailure: true,
    );
  }

  LogoutState copyWith({
    bool isSuccess,
    bool isFailure,
  }) {
    return LogoutState(
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''LogoutState {
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }

}
