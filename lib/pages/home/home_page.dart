import 'package:flutter/material.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const HomePage({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
