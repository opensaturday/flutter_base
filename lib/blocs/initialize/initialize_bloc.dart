import 'package:bloc/bloc.dart';
import 'package:flutter_base/blocs/authentication/authentication.dart';

import 'initialize.dart';

class InitializeBloc extends Bloc<InitializeEvent, InitializeState> {
  @override
  InitializeState get initialState => throw Uninitialized();

  @override
  Stream<InitializeState> mapEventToState(InitializeEvent event) async* {
    if (event is AppStarted) {

    }
  }
}
