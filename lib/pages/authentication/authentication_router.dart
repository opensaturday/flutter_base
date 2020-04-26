import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationRouter extends StatelessWidget {
  final String parentSegment = "auth";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        BlocProvider.of<RouteBloc>(context).add(NavigatePop());
        return Future.value(false);
      },
      child: BlocBuilder<RouteBloc, RouteState>(
        builder: (context, state) {
          var uri = Uri.parse(state.route);
          var segments = uri.pathSegments;

          String route = "/error/404";
          if (segments.isNotEmpty && segments.contains(parentSegment)) {
            route = segments[1];
          }

          switch (route) {
            case "login":
              return LoginPage();
            case "logout":
              return LogoutPage();
            case "register":
              return RegisterPage();
            default:
              return LoginPage();
          }
        },
      ),
    );
  }
}
