import "package:app_core/app_core.dart";
import "package:flutter/material.dart";
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_base/repository/route/route_model.dart';
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
          RepositoryProvider<RouteModel>(
            create: (context) => RouteRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
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
              "/": (context) => RootPage(),
              "/sitemap": (context) => SiteMapPage(),
              "/home": (context) => HomePage(),
              "/editor": (context) => EditorPage(),
              "/login": (context) => LoginPage(
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  ),
              "/register": (context) => RegisterPage(
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  ),
            },
            initialRoute: flavor == "mock" ? "/sitemap" : "/",
          ),
        ));
  }
}
