import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashViewState();

}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SplashView', key: Key('pageTitle')),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}