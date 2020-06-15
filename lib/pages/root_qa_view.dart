import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootQaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dev mode, page list"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Splash page'),
            subtitle: Text('Check update & initialize'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              BlocProvider.of<RouteBloc>(context).add(NavigatePush("/splash"));
            },
          ),
          ListTile(
            title: Text('Auth page'),
            subtitle: Text('Login & Register'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              BlocProvider.of<RouteBloc>(context).add(NavigatePush("/login"));
            },
          ),
          ListTile(
            title: Text('Home page'),
            subtitle: Text('Home page'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              BlocProvider.of<RouteBloc>(context).add(NavigatePush("/home"));
            },
          ),
        ],
      ),
    );
  }
}