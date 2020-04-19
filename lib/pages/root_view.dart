import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Splash Page', key: Key('pageTitle')),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
