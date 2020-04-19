import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/auth/login_page.dart';
import '../pages/home/home_page.dart';

class CheckGivenWidgets
    extends Given3WithWorld<String, String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3) async {
    final textinput1 = find.byValueKey(input1);
    final textinput2 = find.byValueKey(input2);
    final button = find.byValueKey(input3);
    await FlutterDriverUtils.isPresent(textinput1, world.driver);
    await FlutterDriverUtils.isPresent(textinput2, world.driver);
    await FlutterDriverUtils.isPresent(button, world.driver);
  }

  @override
  RegExp get pattern => RegExp(r'I have {string} and {string} and {string}');
}

class ClickLoginButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String loginButton) async {
    final loginFinder = find.byValueKey(loginButton);
    await FlutterDriverUtils.tap(world.driver, loginFinder);
  }

  @override
  RegExp get pattern => RegExp(r'I tap the {string} button');
}

class MoveToPage extends Given1WithWorld<String, FlutterWorld> {
  MoveToPage()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 30));

  @override
  Future<void> executeStep(String page) async {
    switch (page) {
      case "home":
        final page = HomePage(world.driver);
        await page.moveToPage(world);
        break;
      case "login":
        final page = LoginPage(world.driver);
        await page.moveToPage(world);
        break;
    }
  }

  @override
  RegExp get pattern => RegExp(r"I go to (home|login) page");
}

class ExpectElementToHaveValue
    extends Then2WithWorld<String, String, FlutterWorld> {
  @override
  RegExp get pattern =>
      RegExp(r"I expect (home|login) page title to be {string}");

  @override
  Future<void> executeStep(String page, String value) async {
    switch (page) {
      case "login":
        final page = LoginPage(world.driver);
        await page.compSecondPageTitleValue(value, world);
        break;
      case "home":
        final page = HomePage(world.driver);
        await page.compSecondPageTitleValue(value, world);
        break;
    }
  }
}
