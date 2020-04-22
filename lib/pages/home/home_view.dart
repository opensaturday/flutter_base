import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', key: Key("pageTitle")),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () =>
                  BlocProvider.of<RouteBloc>(context).add(MoveToLogout()),
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.textsms),
              onPressed: () => Navigator.of(context).pushNamed("/editor"),
            ),
          ),
        ],
      ),
    );
  }
}
