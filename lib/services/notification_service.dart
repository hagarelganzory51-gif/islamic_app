import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();

    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const settings = InitializationSettings(
      android: androidSettings,
    );

    await notifications.initialize(
      settings: settings,
    );

    await notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestExactAlarmsPermission();
  }

  static Future<void> schedulePrayerNotification({
    required int id,
    required String prayerName,
    required String prayerTime,
  }) async {
    int hour;
    int minute;

    if (!prayerTime.toUpperCase().contains('AM') &&
        !prayerTime.toUpperCase().contains('PM')) {
      final parts = prayerTime.split(':');

      hour = int.parse(parts[0]);
      minute = int.parse(parts[1]);
    } else {
      final parts = prayerTime.split(' ');
      final timeParts = parts[0].split(':');

      hour = int.parse(timeParts[0]);
      minute = int.parse(timeParts[1]);

      final period = parts[1].toUpperCase();

      if (period == 'PM' && hour != 12) {
        hour += 12;
      }

      if (period == 'AM' && hour == 12) {
        hour = 0;
      }
    }

    final now = tz.TZDateTime.now(tz.local);

    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(
        const Duration(days: 1),
      );
    }

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'prayer_channel',
        'Prayer Notifications',
        channelDescription: 'Notifications for prayer times',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await notifications.zonedSchedule(
      id: id,
      title: 'Prayer Time',
      body: 'It is time for $prayerName prayer',
      scheduledDate: scheduledDate,
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> cancelPrayerNotification(int id) async {
    await notifications.cancel(id: id);
  }

  static Future<void> showTestNotification() async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'prayer_channel',
        'Prayer Notifications',
        channelDescription: 'Notifications for prayer times',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await notifications.show(
      id: 1,
      title: 'Prayer Time',
      body: 'It is time for prayer',
      notificationDetails: details,
    );
  }
}