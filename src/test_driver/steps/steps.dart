import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric N() {
  return when2<String, int, FlutterWorld>(
    'I alibab es',
        (key, count, context) async {
      final locator = find.byValueKey(key);
      //print('############' + locator.toString());
      for (var i = 0; i < count; i += 1) {
        await FlutterDriverUtils.tap(context.world.driver, locator);
      }
    },
  );
}