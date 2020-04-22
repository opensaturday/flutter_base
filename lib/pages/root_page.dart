import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const RootPage({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is Authenticated) {
              BlocProvider.of<RouteBloc>(context).add(MoveToHome());
            } else if (state is Unauthenticated) {
              BlocProvider.of<RouteBloc>(context).add(MoveToLogin());
            }
          },
        ),
      ],
      child: BlocBuilder<RouteBloc, RouteState>(
        builder: (context, state) {
          print("RouteBloc:$state");
          switch (state.route) {
            case "/home":
              return HomePage();
            case "/login":
              return LoginPage();
            case "/logout":
              return LogoutPage();
            case "/":
            default:
              return SplashView();
          }
        },
      ),
    );
  }
}
