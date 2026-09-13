
import 'package:flutter/material.dart';
import 'package:islamic_app/services/notification_service.dart';

class PrayerRow extends StatefulWidget {
  final IconData icon;
  final String name;
  final String time;
  final bool notification;

  const PrayerRow({
    super.key,
    required this.icon,
    required this.name,
    required this.time,
    required this.notification,
  });

  @override
  State<PrayerRow> createState() => _PrayerRowState();
}

class _PrayerRowState extends State<PrayerRow> {
  late bool isNotificationOn;

  @override
  void initState() {
    super.initState();
    isNotificationOn = widget.notification;
  }
  int get notificationId {
    switch (widget.name) {
      case 'Fajr':
        return 1;

      case 'Sunrise':
        return 2;

      case 'Dhuhr':
        return 3;

      case 'Asr':
        return 4;

      case 'Maghrib':
        return 5;

      case 'Isha':
        return 6;

      default:
        return 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: Colors.amber,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            widget.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),

        Text(
          widget.time,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),

        Switch(
          value: isNotificationOn,
          onChanged: (value) async {
            setState(() {
              isNotificationOn = value;
            });
             if (value) {
              await NotificationService.schedulePrayerNotification(
                id: notificationId,
                prayerName: widget.name,
                prayerTime: widget.time,
              );
            } else {
              await NotificationService.cancelPrayerNotification(
                notificationId,
              );
            }

          },
        ),
      ],
    );
  }
}

