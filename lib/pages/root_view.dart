import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteBloc, RouteState>(
      builder: (context, state) {
        print("RouteBloc:$state");
        switch (state.route) {
          case "/home":
            return HomePage();
          case "/login":
            return LoginPage();
          default:
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
      },
    );
  }
}
