import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric PageShown() {
  return then1<String, FlutterWorld>(
    'I expect that page {string} to be present',
        (string, context) async {
    },
  );
}

StepDefinitionGeneric GivenPage() {
  return given1<String, FlutterWorld>(
    'I expect that page {string} to be present',
        (string, context) async {
    },
  );
}