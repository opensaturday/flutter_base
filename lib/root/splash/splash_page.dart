import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lime_app/common/widget/loading_indicator.dart';
import 'package:lime_app/root/auth/authentication_bloc.dart';
import 'package:lime_app/root/auth/authentication_state.dart';
import 'package:lime_app/root/home/home_page.dart';
import 'package:lime_app/route/bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        print("[SplashPage] - $state");
        if (state is AuthenticationUninitialized) {
          return Scaffold(
            body: Center(
              child: Text('Splash Screen'),
            ),
          );
        }
        if (state is AuthenticationAuthenticated) {
          return HomePage();
        }
        if (state is AuthenticationUnauthenticated) {
          BlocProvider.of<RouteBloc>(context).add(NavigateReplace("/pageA"));
        }
        if (state is AuthenticationLoading) {
          return LoadingIndicator();
        }
        return Scaffold(
          body: Center(
            child: Text('Splash Screen'),
          ),
        );
      },
    );

//    return Scaffold(
//        body: Center(
//      child: Text('Splash Screen'),
//    ));
//    return BlocListener<AuthenticationBloc, AuthenticationState>(
//      listener: (context, state) {
//        if (state is AuthenticationUnauthenticated) {
//          BlocProvider.of<RouteBloc>(context).add(NavigateReplace("/login"));
//        }
//      },
//      child: Scaffold(
//          body: Center(
//        child: Text('Splash Screen'),
//      )),
//    );
  }
}
