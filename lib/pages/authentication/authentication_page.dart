import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';

class AuthenticationPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AuthenticationPage({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocComponent(
      repositories: [],
      blocs: [],
      child: AuthenticationRouter(),
    );
  }
}
