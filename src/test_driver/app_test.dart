import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/tap_button_n_times_step.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob('test_driver/features/*.*.feature')]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './test_report.json')
    ]
    ..stepDefinitions = [TapButtonNTimesStep(), LoggedIn()]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = 'test_driver/app.dart';
  return GherkinRunner().execute(config);
}

class AttachScreenshotOnFailedStepHook extends Hook {
  /// Run after a step has executed
  @override
  Future<void> onAfterStep(World world, String step, StepResult stepResult) async {
    if (stepResult.result == StepExecutionResult.fail) {
      world.attach('Some info.','text/plain');
      world.attach('{"some", "JSON"}}', 'application/json');
    }
  }
}
