import 'package:bloc/bloc.dart';

import 'checker.dart';

class CheckBloc extends Bloc<CheckerEvent, CheckerState> {
  @override
  CheckerState get initialState =>
      NoMoreUpdates(checkedAt: DateTime.now().millisecond);

  @override
  Stream<CheckerState> mapEventToState(CheckerEvent event) async* {
    if (event is AppUpdateCheck) {
      try {
        yield UpdateAreAvailable();
      } catch (error) {
        yield UpdateCheckFailed();
      }
    }
  }
}
