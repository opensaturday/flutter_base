import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Logout Page', key: Key('pageTitle')),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
