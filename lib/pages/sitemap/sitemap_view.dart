import 'package:flutter/material.dart';

class SiteMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Jeresy Cool!', key: Key('firstTabTitle')),
            Text('Hello, Jersey!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 30,
                ),
                key: Key('textField')),
//            CircularProgressIndicator(),
            RaisedButton(
              key: Key("HomeButton"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () => Navigator.of(context).pushNamed("/home"),
              child: Text('Home'),
            ),
            RaisedButton(
              key: Key("EditorButton"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () => Navigator.of(context).pushNamed("/editor"),
              child: Text('Editor'),
            ),
            RaisedButton(
              key: Key("LoginButton"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () => Navigator.of(context).pushNamed("/login"),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
