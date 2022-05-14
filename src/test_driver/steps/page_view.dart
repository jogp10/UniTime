import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric PageShown() {
  return then1<String, FlutterWorld>(
    'I expect the text {string} to be present',
        (string, context) async {
      final locator = find.text(string);
      await FlutterDriverUtils.isPresent(context.world.driver, locator);
    },
  );
}