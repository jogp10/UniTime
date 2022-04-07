import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:src/my_custom_form.dart';
import 'package:src/my_calendar.dart';
import 'package:src/my_notification.dart';

void main() {
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelKey: 'schedule_channel',
        channelName: 'Schedule Notifications',
        defaultColor: Colors.blue[800],
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
    ],
  );
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniTime'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        child:
          MyNotification(),
      ),
    );
  }

  Widget buildCustomForm() {
    return const MyCustomForm();
  }

  Widget buildCalendar() {
    return const MyCalendar();
  }

  Widget buildCustomNotification() {
    return const MyNotification();
  }
}
