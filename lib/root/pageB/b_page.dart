import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lime_app/route/bloc.dart';

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<RouteBloc>(context).add(NavigatePop());
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
              BlocProvider.of<RouteBloc>(context).add(NavigatePop());
            },
          ),
        ),
      ),
    );
  }
}