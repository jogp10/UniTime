import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:glob/glob.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class TapFloatingButton extends WhenWithWorld<FlutterWorld>{
  @override
  Future<void> executeStep() async {
    // TODO: implement executeStep
    final locator = find.byTooltip("Adicionar Evento");
    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => Glob(r"I tap the floating button");

}
