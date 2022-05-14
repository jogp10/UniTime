import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class UserTapsIn extends WhenWithWorld<FlutterWorld>{
  @override
  Future<void> executeStep() async {
    final locator = find.byType('NavegationDrawer');
    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  RegExp get pattern => RegExp(r"the user taps on the plus button");

}