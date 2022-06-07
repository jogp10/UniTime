import 'package:flutter/material.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {
  final int day;
  final int month;
  final int year;
  final TimeOfDay timeOfDay;

  NotificationWeekAndTime({
    @required this.day,
    @required this.month,
    @required this.year,
    @required this.timeOfDay,
  });
}