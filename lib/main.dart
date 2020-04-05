import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import 'package:flutter_base/LimeApp.dart';
import 'package:flutter_base/LimeAppBlocDelegate.dart';
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  // Global initialize
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = LimeAppBlocDelegate();

  // Run Application
  runApp(LimeApp());
}
