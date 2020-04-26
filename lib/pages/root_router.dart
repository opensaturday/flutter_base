import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is Authenticated) {
              BlocProvider.of<RouteBloc>(context).add(NavigatePush("/home"));
            } else if (state is Unauthenticated) {
              BlocProvider.of<RouteBloc>(context)
                  .add(NavigatePush("/auth/login"));
            }
          },
        ),
      ],
      child: BlocBuilder<RouteBloc, RouteState>(
        builder: (context, state) {
          var uri = Uri.parse(state.route);
          var segments = uri.pathSegments;

          String route = "/";
          if (segments.isNotEmpty) {
            route = segments[0];
          }

          switch (route) {
            case "auth":
              return AuthenticationRouter();
            case "home":
              return HomeRouter();
            default:
              return RootPage();
          }
        },
      ),
    );
  }
}
