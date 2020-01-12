import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lime_app/repository/repository.dart';
import 'package:lime_app/root/auth/authentication_bloc.dart';

import 'login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: RepositoryProvider.of<UserRepository>(context),
          );
        },
        child: LoginForm(),
      ),
    );
  }
}