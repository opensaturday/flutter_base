import 'package:flutter/cupertino.dart';
import 'package:flutter_base/blocs/blocs.dart';
import 'package:flutter_base/pages/home/editor/editor.dart';
import 'package:flutter_base/pages/home/home.dart';
import 'package:flutter_base/repository/repository.dart';
import 'package:flutter_base/repository/route/route_entity.dart';
import 'package:flutter_base/repository/route/route_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRouter extends StatelessWidget {
  final String parentSegment = "home";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("HomeRouter");
        var repository =  RepositoryProvider.of<RouteModel>(context);
        print("$repository");
        List<RouteEntity> routeEntities = await repository.loadRoutes();
        print(routeEntities);
        if (routeEntities.length > 1) {
          BlocProvider.of<RouteBloc>(context).add(NavigatePop());
          return await Future.value(false);
        } else {
          return await Future.value(true);
        }
      },
      child: BlocBuilder<RouteBloc, RouteState>(
        builder: (context, state) {
          var uri = Uri.parse(state.route);
          var segments = uri.pathSegments;

          String route = "/error/404";
          if (segments.isNotEmpty && segments.contains(parentSegment)) {
            if (segments.length > 1) {
              route = segments[1];
            } else {
              route = segments[0];
            }
          }

          if (route.isEmpty) {
            Navigator.pop(context, true);
          }

          switch (route) {
            case "editor":
              return EditorPage();
            default:
              return HomePage();
          }
        },
      ),
    );
  }
}
