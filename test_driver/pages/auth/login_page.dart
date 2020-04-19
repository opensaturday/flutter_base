import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_gherkin/src/flutter/flutter_world.dart';

import '../app_base_page.dart';

class LoginPage extends AppBasePage {

  final pageTitle = 'pageTitle';
  final pageMoveButton = 'LoginButton';

  LoginPage(FlutterDriver driver) : super(driver) {
    final locator = super.finElementByKey(pageTitle);
    AppBasePage.waitFor(driver, locator);
  }

  Future<void> moveToPage(FlutterWorld world) async {
    final locator = super.finElementByKey(pageMoveButton);
    await AppBasePage.tap(world.driver, locator, world);
  }

  Future<void> compSecondPageTitleValue(String value, FlutterWorld world) async {
    final text = await AppBasePage.getText(world.driver, find.byValueKey(pageTitle));
    await AppBasePage.compareText(text, value);
  }
}