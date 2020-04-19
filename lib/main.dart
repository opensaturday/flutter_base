import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import 'package:flutter_base/LimeApp.dart';
import 'package:flutter_base/blocs/SimpleBlocDelegate.dart';
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  // Global initialize
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  // Run Application
  runApp(LimeApp());
}
