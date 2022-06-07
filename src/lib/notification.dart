import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:uni/utilities.dart';

Future<void> createDaysLeftNotification(
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: '${Emojis.paper_closed_book} Event Soon!',
        body: 'Um evento está próximo!',
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
          autoCancel: true,
          enabled: true,
        ),
      ],
      schedule: NotificationCalendar(
        year: notificationSchedule.year,
        month: notificationSchedule.month,
        day: notificationSchedule.day,
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,

      )
  );
}

