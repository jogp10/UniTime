import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:src/utilities.dart';

Future<void> createDaysLeftNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'schedule_channel',
      title:
          '${Emojis.icon_hundred_points + Emojis.paper_closed_book} Avaliação em 7 dias',
      body: 'Exame de Engenharia de Sofware em dd/mm, às hh:mm',
    ),
  );
}
