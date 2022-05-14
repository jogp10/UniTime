import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:steps/steps.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:uni/main.dart';

Future<void> main(){
  enableFlutterDriverExtension();

  runApp(MyApp());
}