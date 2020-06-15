import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocComponent(
      repositories: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider<RouteRepository>(
          create: (context) => RouteRepository(),
        ),
      ],
      blocs: [
        BlocProvider<RouteBloc>(
          create: (context) => RouteBloc(
            routeRepository: RepositoryProvider.of<RouteRepository>(context),
          ),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
        ),
      ],
      child: RootRouter(),
    );
  }
}
