import 'package:flutter/material.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_base/root/auth/bloc/authentication_bloc.dart';
import 'package:flutter_base/root/auth/bloc/authentication_state.dart';
import 'package:flutter_base/root/auth/login/login.dart';
import 'package:flutter_base/root/home/home.dart';
import 'package:flutter_base/root/root_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return HomeScreen();
        } else if (state is Unauthenticated) {
          return LoginScreen(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          );
        } else if (state is AuthenticationLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Uninitialized) {
          return RootView();
        } else {
          return RootView();
        }
      },
    );
  }
}
