import 'package:bloc/bloc.dart';
import 'package:flutter_base/blocs/authentication/authentication.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:meta/meta.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  UserRepository _userRepository;

  LogoutBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LogoutState get initialState => LogoutState.empty();

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {
    if (event is FireSession) {
      yield* _mapFireSessionToState();
    }
  }

  Stream<LogoutState> _mapFireSessionToState() async* {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      print("이거 나중에 꼭 지워야 한다.");
    });
    yield LogoutState.success();
  }
}
