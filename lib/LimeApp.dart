import "package:app_core/app_core.dart";
import "package:flutter/material.dart";
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_localizations/flutter_localizations.dart";

class LimeApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  final String flavor;

  LimeApp({Key key, this.flavor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository>(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider<RouteRepository>(
            create: (context) => RouteRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<RouteBloc>(
              create: (context) => RouteBloc(
                routeRepository: RepositoryProvider.of<RouteRepository>(context),
              ),
            ),
            BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context),
              )..add(AppStarted()),
            ),
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
            routes: {
              "/": (context) => RootRouter(),
              "/sitemap": (context) => SiteMapPage(),
            },
            initialRoute: flavor == "mock" ? "/sitemap" : "/",
          ),
        ));
  }
}
