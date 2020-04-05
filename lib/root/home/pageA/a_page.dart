import 'package:flutter/material.dart';
import 'package:flutter_base/route/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocProvider.of<RouteBloc>(context).add(NavigatePush("/pageB"));
          },
        ),
      ),
    );
  }
}
