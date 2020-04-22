import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        print("Logout::$state");
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        }
      },
      child: BlocBuilder<LogoutBloc, LogoutState>(builder: (context, state) {
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
      }),
    );
  }
}
