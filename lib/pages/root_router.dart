import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/flavor_config.dart';
import 'package:flutter_base/pages/root.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<RouteBloc, RouteState>(
            listener: (context, state) {
              print("-------------- RouteBloc Listener state=$state");
              Navigator.of(context).pushNamed(state.route);
            },
          ),
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              print("-------------- AuthenticationBloc Listener state=$state");
            },
          )
        ],
      child: _getView(),
    );
  }

  Widget _getView() {
    Widget view = RootView();
    switch(FlavorConfig.instance.flavor) {
      case Flavor.QA:
        view = RootQaView();
        break;
      case Flavor.DEV:
      case Flavor.PRODUCTION:
        break;
    }
    return view;
  }

}
