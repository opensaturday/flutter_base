import 'package:flutter/material.dart';

class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page A'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to PageB'),
          onPressed: () {
            Navigator.of(context).pushNamed("/pageB");
          },
        ),
      ),
    );
  }
}
