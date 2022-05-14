import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/tap_button_n_times_step.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'steps/steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './test_report.json')
    ]
    ..stepDefinitions = [TapButtonNTimesStep(), LoggedIn(), OpenDrawer(), N()]
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

class OpenDrawer extends WhenWithWorld<FlutterWorld>{
  @override
  Future<void> executeStep() async {
    // TODO: implement executeStep
    final appBarFinder = find.byType("AppBar");
    final locator = find.descendant(of: appBarFinder, matching: find.byType("Button"));
    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => Glob(r"I open the drawer");

}

class ShowPage extends WhenWithWorld<FlutterWorld>{
  @override
  Future<void> executeStep() async {
    // TODO: implement executeStep
    final locator = find.byType("IconThemeData");
    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => Glob(r"I expect that page {string} to be present");

}

