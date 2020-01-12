import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lime_app/root/auth/login/login_page.dart';
import 'package:lime_app/root/splash/splash_page.dart';

import 'root/pageA/a_page.dart';
import 'root/pageB/b_page.dart';

class LimeApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  LimeApp({Key key, @required this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
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
      initialRoute: "/",
      routes: {
        "/": (context) => SplashPage(),
        "/pageA": (context) => APage(),
        "/pageB": (context) => BPage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
