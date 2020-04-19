import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/pages/pages.dart';

class EditorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EditorView();
//    return MultiBlocListener(
//      listeners: [
//        BlocListener<AuthenticationBloc, AuthenticationState>(
//          listener: (context, state) { print("AuthenticationState=$state");},
//        ),
//        BlocListener<RouteBloc, RouteState>(
//          listener: (context, state) { print("RouteState=$state");},
//        ),
//      ],
//      child: EditorView(),
//    );
  }

}
