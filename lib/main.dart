import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import 'package:flutter_base/LimeApp.dart';
import 'package:flutter_base/blocs/SimpleBlocDelegate.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import 'flavor_config.dart';

void main() {
  // Global initialize
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  // Flavor settings
  FlavorConfig(
    flavor: Flavor.QA,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(baseUrl: "https://opensaturday.com"),
  );

  // Run Application
  runApp(LimeApp());
}
