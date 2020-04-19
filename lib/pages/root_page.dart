import 'package:flutter/material.dart';
import 'package:flutter_base/pages/pages.dart';

class RootPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const RootPage({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RootView();
  }
}
