import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocComponent extends StatelessWidget {
  final List<RepositoryProvider> repositories;
  final List<BlocProvider> blocs;
  final Widget child;

  const BlocComponent({
    Key key,
    @required this.repositories,
    @required this.blocs,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: repositories,
        child: MultiBlocProvider(
          providers: blocs,
          child: child,
        ));
  }
}