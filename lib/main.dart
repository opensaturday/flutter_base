import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lime_app/LimeApp.dart';
import 'package:lime_app/LimeAppBlocDelegate.dart';
import 'package:lime_app/repository/route/route_model.dart';
import 'package:lime_app/root/auth/bloc.dart';

import 'repository/repository.dart';
import 'root/auth/authentication_bloc.dart';
import 'route/route_bloc.dart';

void main() {
  // Global initialize
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = LimeAppBlocDelegate();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // Run Application
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider<RouteModel>(
          create: (context) => RouteRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context))..add(AppStarted()),
          ),
          BlocProvider<RouteBloc>(
            create: (context) => RouteBloc(
                navigatorKey: navigatorKey,
                routeRepository: RepositoryProvider.of<RouteModel>(context)
            ),
          )
        ],
        child: LimeApp(navigatorKey: navigatorKey),
      ),
    ),
  );
}
