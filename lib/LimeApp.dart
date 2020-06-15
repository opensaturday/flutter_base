import "package:app_core/app_core.dart";
import "package:flutter/material.dart";
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_base/pages/splash/splash.dart';
import "package:flutter_localizations/flutter_localizations.dart";

class LimeApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  LimeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
      },
      initialRoute: "/",
    );
  }
}
