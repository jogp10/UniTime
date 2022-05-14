import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


StepDefinitionGeneric TapButtonNTimesStep() {
  return when2<String, int, FlutterWorld>(
    'I tap the {string} button {int} times',
        (key, count, context) async {
      final locator = find.byValueKey(key);
      //print('############' + locator.toString());
      for (var i = 0; i < count; i += 1) {
        await FlutterDriverUtils.tap(context.world.driver, locator);
      }
    },
  );
}

StepDefinitionGeneric LoggedIn() {
  return given<FlutterWorld>(
    'I am logged in',
      (context) async {
      final locator = find.byValueKey('fotoicon');
      FlutterDriverUtils.isPresent(context.world.driver, locator);
      },
  );
}