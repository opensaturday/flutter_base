import 'package:flutter/cupertino.dart';
import 'package:flutter_base/blocs/authentication/authentication.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      )..add(FireSession()),
      child: LogoutView(),
    );
  }
}
