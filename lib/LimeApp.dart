import "package:app_core/app_core.dart";
import "package:flutter/material.dart";
import "package:flutter_base/repository/repository.dart";
import "package:flutter_base/repository/route/route_model.dart";
import "package:flutter_base/root/auth/bloc/authentication_bloc.dart";
import "package:flutter_base/root/auth/bloc/bloc.dart";
import "package:flutter_base/root/home/editor/editor_screen.dart";
import "package:flutter_base/root/home/home.dart";
import "package:flutter_base/root/home/pageA/a_page.dart";
import "package:flutter_base/root/home/pageB/b_page.dart";
import "package:flutter_base/root/root.dart";
import 'package:flutter_base/route/route_bloc.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_localizations/flutter_localizations.dart";

class LimeApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  LimeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
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
                  userRepository:
                      RepositoryProvider.of<UserRepository>(context))
                ..add(AppStarted()),
            ),
            BlocProvider<RouteBloc>(
              create: (context) => RouteBloc(
                  navigatorKey: _navigatorKey,
                  routeRepository: RepositoryProvider.of<RouteModel>(context)),
            )
          ],
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            theme: AppTheme.theme,
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context).title,
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('ko', ''), // 한국어
              const Locale('en', ''), // English
            ],
            home: RootPage(),
            routes: {
              "/home": (context) => HomeScreen(),
              "/pageA": (context) => APage(),
              "/pageB": (context) => BPage(),
              "/editor": (context) => EditorScreen(),
              "/login": (context) => LoginScreen(
                  userRepository:
                      RepositoryProvider.of<UserRepository>(context)),
            },
          ),
        ));
  }
}
