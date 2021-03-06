import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/authentication/register/register.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => BlocProvider.of<RouteBloc>(context).add(NavigatePop()),
            );
          },
        ),
      ),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
