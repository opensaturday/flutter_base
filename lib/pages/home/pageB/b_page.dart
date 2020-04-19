import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Page B'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Pop'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
