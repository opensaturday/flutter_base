import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const HomePage({Key key, this.navigatorKey}) : super(key: key);

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
      child: HomeRouter(),
    );
  }
}
