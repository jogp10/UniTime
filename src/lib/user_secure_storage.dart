import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyEvents = 'events';

  static Future setEvents(List<String> events) async {

    final value = json.encode(events);
    print("ola\n");
    await _storage.write(key: _keyEvents, value: value);
  }

  static Future<List<String>> getEvents() async {
    final value = await _storage.read(key: _keyEvents);
    return value == null ? null: List<String>.from(json.decode(value));
  }



}