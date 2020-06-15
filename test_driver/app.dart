import 'package:flutter/material.dart';
import 'package:flutter_base/LimeApp.dart';
import 'package:flutter_base/flavor_config.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();

  // Flavor settings
  FlavorConfig(
    flavor: Flavor.QA,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(baseUrl: "https://opensaturday.com"),
  );

  runApp(LimeApp());
}
